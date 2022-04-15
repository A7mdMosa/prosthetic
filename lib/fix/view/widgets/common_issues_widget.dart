import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonIssuesWidget extends StatefulWidget {
  const CommonIssuesWidget({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  State<CommonIssuesWidget> createState() => _CommonIssuesWidgetState();
}

class _CommonIssuesWidgetState extends State<CommonIssuesWidget> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.h),
        color: Colors.orange.shade400.withOpacity(0.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                softWrap: true,
                maxLines: 2,
                style: TextStyle(
                  fontFamily: 'Signika',
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    expanded = !expanded;
                  });
                },
                child: Icon(
                  Icons.expand_more_rounded,
                  size: 25.h,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          expanded
              ? Text(
                  widget.description,
                  style: TextStyle(
                    fontFamily: 'Signika',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
