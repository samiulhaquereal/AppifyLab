import 'package:appifylabtask/src/config/import/imports.dart';

class LoginScreen extends BaseView<LoginScreenController> {
  LoginScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Color pageBackgroundColor() {
    return AppColors.primaryColor;
  }

  @override
  Widget body(BuildContext context) {
    return Visibility(
      visible: !controller.prefs.getIsLogin(),
      child: Stack(
        children: [
          Positioned(
              top: -20.h,
              left: 0.w,
              right: 0.w,
              child: AssetImageView(fileName: AssetsPath.circleDesign1)),
          Positioned(
              top: 90.h,
              left: 0.w,
              right: 0.w,
              child: AssetImageView(fileName: AssetsPath.circleDesign2)),
          Positioned(
              top: 80.h,
              left: 0.w,
              right: 0.w,
              child: AssetImageView(fileName: AssetsPath.logoImage,width: 200.w,height: 100.h)),
          Positioned(
              top: 300.h,
              left: 0.w,
              right: 0.w,
              child: Container(
                height: Get.height.h,
                width: Get.width.w,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30.r),topLeft: Radius.circular(30.r)),
                  border: Border.all(color: AppColors.loginFormBorderColor,width: 2.w),
                ),
                child: _buildLoginForm(),
              )
          )
        ],
      ),
    );
  }

  Widget _buildLoginForm() {
    return Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: startCAA,
                children: [
                  Gap(10.h),
                  Center(child: Text('Sign In',style: GoogleFonts.figtree(fontSize: 38.sp,fontWeight: FontWeight.w600,color: AppColors.whiteColor))),
                  Gap(20.h),
                  Text('Email',style: GoogleFonts.figtree(fontSize: 14.sp,fontWeight: FontWeight.w500,color: AppColors.loginFormLabelColor.withOpacity(0.5))),
                  Gap(5.h),
                  CustomTextField(
                      hint: 'Email',
                      keyboardType: emailAddressInputType,
                      labelSize: 10.sp,
                      inputFontSize: 11.sp,
                      controller: controller.emailController,
                      isBorder: true,
                      isRequired: true,
                      isSuffixIcon: true,
                      borderRadius: 5.r,
                      inputFontColor: AppColors.whiteColor,
                      focusedColor: AppColors.loginFormBorderColor,
                      borderColor: AppColors.loginFormLabelColor.withOpacity(0.5),
                      validator: emailValidator
                  ),
                  Gap(15.h),
                  Text('Password',style: GoogleFonts.figtree(fontSize: 14.sp,fontWeight: FontWeight.w500,color: AppColors.loginFormLabelColor.withOpacity(0.5))),
                  Gap(5.h),
                  CustomTextField(
                      hint: 'Password',
                      keyboardType: emailAddressInputType,
                      labelSize: 10.sp,
                      inputFontSize: 11.sp,
                      iconColor: AppColors.loginFormLabelColor.withOpacity(0.5),
                      isPasswordField:true,
                      controller: controller.passwordController,
                      isBorder: true,
                      inputFontColor: AppColors.whiteColor,
                      isRequired: true,
                      borderRadius: 5.r,
                      focusedColor: AppColors.loginFormBorderColor,
                      borderColor: AppColors.loginFormLabelColor.withOpacity(0.5),
                      validator: passwordValidator
                  ),
                  Gap(6.h),
                  Obx(() => Row(
                    crossAxisAlignment: centerCAA,
                    mainAxisAlignment: startMAA,
                    children: [
                      Checkbox(
                        checkColor: AppColors.whiteColor,
                        value: controller.rememberPassword.value,
                        onChanged: (value) => controller.toggleRememberPassword(),
                        side: BorderSide(color: AppColors.loginFormLabelColor.withOpacity(0.5), width: 1.w),
                      ),
                      Text(
                        'Remember Password',
                        style: GoogleFonts.figtree(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.loginFormLabelColor.withOpacity(0.5),
                        ),
                      ),
                    ],
                  )),
                  Gap(6.h),
                  SizedBox(
                    width: Get.width.w,
                    child: ElevatedButton(
                        onPressed: controller.onTapLogin,
                        style: buttonStyle,
                        child: Text(AppStrings.login,style: primaryTextStyle.copyWith(color: AppColors.primaryColor,fontWeight: FontWeight.w600,fontSize: 14.sp))),
                  )
                ],
              ),
            );
  }
  
}