import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../fix/data/models/fix.dart';

class FixCard extends StatelessWidget {
  const FixCard({Key? key, required this.fix}) : super(key: key);

  final Fix fix;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 50.w),
      height: 80.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.h),
        color: Colors.grey.shade200,
      ),
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                fix.userName,
                style: TextStyle(
                  fontFamily: 'Signika',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade900,
                ),
              ),
              Text(
                DateFormat("yyyy-MM-dd   HH:mm").format(fix.dateTime),
                style: TextStyle(
                  fontFamily: 'Signika',
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade500,
                ),
              ),
            ]),
      ),
    );
  }
}
