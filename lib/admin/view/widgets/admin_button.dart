import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminButton extends StatelessWidget {
  const AdminButton({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.color,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: MaterialButton(
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'Signika',
              fontSize: 25.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.h),
          ),
          minWidth: 270.w,
          height: 85.h,
          onPressed: onPressed),
    );
  }
}
