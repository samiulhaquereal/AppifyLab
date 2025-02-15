import 'package:appifylabtask/src/config/import/imports.dart';

abstract class BaseView<Controller extends BaseController> extends GetView<Controller> with ValidatorMixin, ShorterEnumMixin, StyleMixin {
  BaseView({super.key});

  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: WillPopScope(
          onWillPop: onWillPop,
          child: pageScaffold(context)),
    );
  }


  Widget pageScaffold(BuildContext context) {
    return DefaultTabController(
      length: tabCount(),
      child: Scaffold(
        backgroundColor: pageBackgroundColor(),
        key: globalKey,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset(),
        appBar: appBar(context),
        floatingActionButton: floatingActionButton(),
        body: pageContent(context),
        bottomNavigationBar: bottomNavigationBar(),
        endDrawer: drawer(context),
        extendBodyBehindAppBar: extendBodyBehindAppBar(),
        floatingActionButtonLocation: floatingActionButtonLocation(),
      ),
    );
  }

  Widget body(BuildContext context);

  PreferredSizeWidget? appBar(BuildContext context);

  Widget pageContent(BuildContext context) {
    return SafeArea(
      child: body(context),
    );
  }

  Color pageBackgroundColor() {
    return AppColors.whiteColor;
  }

  Widget? floatingActionButton() {
    return null;
  }

  Future<bool> onWillPop() async {
    return true;
  }

  bool? resizeToAvoidBottomInset() {
    return null;
  }

  int tabCount(){
    return 0;
  }

  bool extendBodyBehindAppBar() {
    return false;
  }

  Widget? bottomNavigationBar() {
    return null;
  }

  FloatingActionButtonLocation? floatingActionButtonLocation() {
    return null;
  }

  Widget? drawer(BuildContext context) {
    return null;
  }

}