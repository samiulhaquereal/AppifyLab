import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:appifylabtask/src/config/import/imports.dart';

class NotFoundScreen extends StatelessWidget with StyleMixin,ShorterEnumMixin{
  NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 16.0.h),
          child: Column(
            mainAxisAlignment: centerMAA,
            children: [
              Icon(Icons.warning, color: AppColors.errorColor, size: 70.sp),
              Gap(16.h),
              Text(
                AppStrings.pageNotFound,
                textAlign: centerTA,
                style:  headerTextStyle.copyWith(
                    color: AppColors.errorColor
                ),
              ),
              Gap(20.h),
              Text(AppStrings.pageNotFoundMessage,
                textAlign: centerTA,
                style: richTextStyle,
              ),
              Gap(22.h),
              ElevatedButton(
                onPressed: Get.back,
                style: homeButtonStyle,
                child: Text(AppStrings.back,style: dialogBoxTextStyle.copyWith(color: AppColors.whiteColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
