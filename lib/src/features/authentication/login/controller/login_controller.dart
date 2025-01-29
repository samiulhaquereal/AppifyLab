import 'package:appifylabtask/src/config/import/imports.dart';

class LoginScreenController extends BaseController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  RxBool rememberPassword = false.obs;

  void toggleRememberPassword() {
    rememberPassword.value = !rememberPassword.value;
  }

  void onTapLogin(){

  }


  @override
  void onInit()async{
    super.onInit();
  }

  /*Future<bool> showAppExitModal() async {
    final shouldPop = await dialog.confirm(
      title: AppStrings.exit,
      subtitle: AppStrings.exitMessage,
    );
    return shouldPop ?? false;
  }*/
}
