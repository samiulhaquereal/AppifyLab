import 'package:appifylabtask/src/config/import/imports.dart';

class LoginScreenController extends BaseController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  RxBool rememberPassword = false.obs;

  void toggleRememberPassword() {
    rememberPassword.value = !rememberPassword.value;
  }

  void onTapLogin()async{
    if(formKey.currentState!.validate()){
      await dataFetcher(() async {
        await _loginAuth();
      });
    }
  }

  Future<void> _loginAuth()async{
    Map<String, dynamic>? response = await apiServices.userLogin(email: emailController.text.trim(), password: passwordController.text.trim());
    if(response != null && response.isNotEmpty){
      await prefs.setTokenType(response['response']['type']);
      await prefs.setToken(response['response']['token']);
      await prefs.setIsLogin(isLogin: true);
      _navigateToDashboard();
    }
  }


  @override
  void onInit()async{
    super.onInit();
    await prefs.getIsLogin() == true ? _navigateToDashboard() : null ;
  }

  void _navigateToDashboard(){
    Get.toNamed(Routes.getDashboardRoute());
  }

  /*Future<bool> showAppExitModal() async {
    final shouldPop = await dialog.confirm(
      title: AppStrings.exit,
      subtitle: AppStrings.exitMessage,
    );
    return shouldPop ?? false;
  }*/
}
