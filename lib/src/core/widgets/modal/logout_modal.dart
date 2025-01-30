import 'package:appifylabtask/src/config/import/imports.dart';

class LogoutModal{

  static LogoutModal? _instance;
  LogoutModal._internal();
  factory LogoutModal(){
    _instance ??= LogoutModal._internal();
    return _instance!;
  }

  void showLogoutDialog(BuildContext context,VoidCallback onTap) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Logout",
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                Gap(10.h),
                Text(
                  "Are you sure, you want to log out?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.sp),
                ),
                Gap(20.h),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: onTap,
                        child: Text(
                          "Yes",
                          style: TextStyle(color: Colors.blue,fontSize: 14.sp),
                        ),
                      ),
                    ),
                    Container(
                      width: 1.w,
                      height: 25.h,
                      color: AppColors.grayColor,
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          "No",
                          style: TextStyle(color: Colors.black,fontSize: 14.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}