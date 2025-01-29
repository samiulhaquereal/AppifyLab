import 'package:appifylabtask/src/config/import/imports.dart';

class DashboardScreenController extends BaseController {

  RxInt myIndex = 0.obs;
  List<Widget> screenList = [
    Center(child: Text('Community')),
    Center(child: Text('Logout'))
  ];

  @override
  void onInit()async{
    super.onInit();
  }

  void onTapNavigationBar(int index){
    myIndex.value = index;
  }

  /*Future<bool> showAppExitModal() async {
    final shouldPop = await dialog.confirm(
      title: AppStrings.exit,
      subtitle: AppStrings.exitMessage,
    );
    return shouldPop ?? false;
  }*/
}
