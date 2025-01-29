import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:appifylabtask/src/config/import/imports.dart';

mixin StyleMixin {

   TextStyle get primaryTextStyle =>  GoogleFonts.poppins(
       color: AppColors.primaryColor,
       fontSize: 10.sp,
   );

   TextStyle get secondaryTextStyle =>  primaryTextStyle.copyWith(
       color: AppColors.blackColor,
   );

   TextStyle get headerTextStyle => primaryTextStyle.copyWith(
       fontSize:18.sp,
       fontWeight:FontWeight.w700
   );

   TextStyle get dialogBoxTextStyle => primaryTextStyle.copyWith(
     fontSize: 16.sp,
     color: AppColors.blackColor,
     fontWeight: FontWeight.w500,
   );

   TextStyle get richTextStyle => primaryTextStyle.copyWith(
       fontSize: 14.sp
   );

   ButtonStyle get homeButtonStyle => ElevatedButton.styleFrom(
     backgroundColor: AppColors.errorColor,
   );

   TextStyle get splashScreenTextStyle => primaryTextStyle.copyWith(
       fontSize: 17.sp,
       fontWeight: FontWeight.w700
   );


}