import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:appifylabtask/src/config/import/imports.dart';

class CustomErrorWidget extends StatelessWidget with StyleMixin,ShorterEnumMixin {
  final String errorMessage;

  CustomErrorWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
        child: Center(
          child: Column(
            mainAxisAlignment: centerMAA,
            children: [
               Icon(
                LineAwesomeIcons.bug,
                color: AppColors.redColor,
                size: 50.0.sp,
              ),
              Gap(10.h),
              Text(AppStrings.errorOccurred,
                style: headerTextStyle,
              ),
              Gap(10.h),
              Text(
                errorMessage,
                textAlign: centerTA,
                style: dialogBoxTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}