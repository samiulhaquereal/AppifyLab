import 'package:appifylabtask/src/config/import/imports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends BaseWidget<SplashController>{
  SplashScreen({super.key});

  @override
  Widget body(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      alignment: Alignment.center,
      decoration: const BoxDecoration(

      ),
      child: Column(
        mainAxisAlignment: centerMAA,
        children: [
          _buildSplashAnimation(),
          Gap(10.h),
          Text(
              AppStrings.appName,
              style: splashScreenTextStyle
          ),
        ],
      ),
    );
  }

  Widget _buildSplashAnimation() {
    return /*SplashAnimation(
          end: 70.w,
          seconds: 2,
          widget: AssetImageView(
            fileName: logoImage,
            width: 70.w,
          )
        )*/ SizedBox();
  }
}
