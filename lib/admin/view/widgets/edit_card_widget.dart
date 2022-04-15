import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditCardWidget extends StatelessWidget {
  const EditCardWidget(
      {Key? key,
      required this.title,
      required this.image,
      required this.edit,
      required this.delete})
      : super(key: key);

  final String title;
  final String image;
  final VoidCallback edit;
  final VoidCallback delete;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
      height: 110.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.h),
        color: Colors.orange.shade100.withOpacity(0.3),
      ),
      child: Row(children: [
        SizedBox(
          height: 100.h,
          width: 80.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.h),
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 15.w,
        ),
        SizedBox(
          height: 100.h,
          width: 180.w,
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'Signika',
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 25.w,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
                child: Icon(
                  Icons.edit,
                  size: 25.h,
                  color: Colors.grey.shade800,
                ),
                onTap: edit),
            InkWell(
              child: Icon(
                Icons.delete,
                size: 25.h,
                color: Colors.red.shade800,
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text(
                            'ARE YOU SURE ?',
                            style: TextStyle(
                              fontFamily: 'Signika',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.orange.shade900,
                            ),
                          ),
                          content: Text(
                            'Do you want remove this item ?',
                            style: TextStyle(
                              fontFamily: 'Signika',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          actions: [
                            TextButton(
                                child: Text(
                                  'YES',
                                  style: TextStyle(
                                    fontFamily: 'Signika',
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.orange.shade900,
                                  ),
                                ),
                                onPressed: delete),
                            TextButton(
                              child: Text(
                                'NO',
                                style: TextStyle(
                                  fontFamily: 'Signika',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ));
              },
            ),
          ],
        )
      ]),
    );
  }
}
