import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileWidgetItem extends StatelessWidget {
  const ProfileWidgetItem({
    Key? key,
    required this.image,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String image;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8.h),
        height: 50.h,
        width: 310.w,
        child: Row(
          children: [
            Container(
              height: 48.h,
              width: 48.w,
              padding: EdgeInsets.all(5.h),
              decoration: BoxDecoration(
                  color: const Color(0xffFFF8EE),
                  borderRadius: BorderRadius.circular(10.h)),
              child: SvgPicture.asset(image),
            ),
            SizedBox(
              width: 15.w,
            ),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Signika',
                fontSize: 17.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0XFF707070),
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 25.w,
              color: const Color(0XFF707070),
            ),
            SizedBox(
              width: 10.w,
            )
          ],
        ),
      ),
    );
  }
}
