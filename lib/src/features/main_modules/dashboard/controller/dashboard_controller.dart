import 'package:appifylabtask/src/config/import/imports.dart';

class DashboardScreenController extends BaseController {

  RxInt myIndex = 0.obs;
  List<Widget> screenList = [
    FeedScreen(),
    SizedBox()
  ];

  @override
  void onInit()async{
    super.onInit();
  }

  void onTapNavigationBar(int index){
    if (index == 1) {
      LogoutModal().showLogoutDialog(buildContext!,_logout);
    } else {
      myIndex.value = index;
    }
  }

  void _logout()async{
    await dataFetcher(()async{
      await apiServices.logout(tokenType: await prefs.getTokenType(), token: await prefs.getToken());
      prefs.clearSession();
      _navigateToLogin();
    });
  }

  void _navigateToLogin(){
    Get.offAllNamed(Routes.getLoginRoute());
  }

  /*Future<bool> showAppExitModal() async {
    final shouldPop = await dialog.confirm(
      title: AppStrings.exit,
      subtitle: AppStrings.exitMessage,
    );
    return shouldPop ?? false;
  }*/
}
