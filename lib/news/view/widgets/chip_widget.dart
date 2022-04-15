import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChipWidget extends StatelessWidget {
  const ChipWidget({
    Key? key,
    required this.tag,
  }) : super(key: key);

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Chip(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        label: Text(
          tag,
          style: TextStyle(
            fontFamily: 'Signika',
            fontSize: 10.sp,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ));
  }
}
