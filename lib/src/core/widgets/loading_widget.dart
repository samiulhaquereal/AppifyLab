import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:appifylabtask/src/config/import/imports.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*Lottie.asset(
                loadingIcon,
                repeat: true,
                width: 120.w,
                height: 120.h
            ),*/
            Gap(4.h),
            Text('Loading...',style: TextStyle(fontSize: 14.sp,color: AppColors.whiteColor,fontWeight: FontWeight.bold))
          ],
        )
      ),
    );
  }
}