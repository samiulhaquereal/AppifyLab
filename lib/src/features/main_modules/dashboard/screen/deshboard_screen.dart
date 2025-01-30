import 'dart:ui';
import 'package:appifylabtask/src/config/import/imports.dart';

class DashboardScreen extends BaseView<DashboardScreenController> {
  DashboardScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(90.h),
      child: Container(
        color: AppColors.primaryColor,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: startMAA,
              children: [
                AssetImageView(fileName: AssetsPath.menu),
                Gap(10.h),
                Column(
                  mainAxisAlignment: centerMAA,
                  crossAxisAlignment: startCAA,
                  children: [
                    Text('Python Developer Community',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.whiteColor)),
                    Gap(3.h),
                    Text('#General',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.loginFormLabelColor.withOpacity(0.5))),
                  ],
                ),
                Gap(24.h), // Placeholder for alignment symmetry
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Color pageBackgroundColor() {
    return AppColors.transparentColor;
  }

  @override
  Widget? bottomNavigationBar() {
    return _buildNavigationBar();
  }

  @override
  Widget body(BuildContext context) {
    return _buildScreen();
  }

  Widget _buildNavigationBar() {
    return Stack(
      children: [
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.transparentColor,
                border: Border.all(
                  width: 0.5.w,
                  color: AppColors.grayColor.withOpacity(0.5),
                ),
              ),
              child: Obx(() => BottomNavigationBar(
                backgroundColor: AppColors.transparentColor,
                elevation: 0,
                selectedItemColor: AppColors.navBarSelectedColor,
                unselectedItemColor: AppColors.navBarUnSelectedColor,
                currentIndex: controller.myIndex.value,
                selectedLabelStyle: naBarSelectedTextStyle,
                unselectedLabelStyle: naBarUnSelectedTextStyle,
                onTap: (index) => controller.onTapNavigationBar(index),
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.people, size: 20.sp),
                    label: AppStrings.community,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.logout_rounded, size: 20.sp),
                    label: AppStrings.logout,
                  ),
                ],
              ),
              ),
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildScreen() {
    return Obx(
          () => IndexedStack(
        index: controller.myIndex.value,
        children: controller.screenList,
      ),
    );
  }
}