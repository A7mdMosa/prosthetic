import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/news_model.dart';
import '../screens/web_view_screen.dart';
import 'chip_widget.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.news,
  }) : super(key: key);
  final News news;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //web page.
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WebViewScreen(
                    url: news.url,
                  )),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 3.h),
        child: Container(
          height: 100.h,
          width: 350.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.h),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ChipWidget(tag: news.tag1),
                      SizedBox(
                        width: 5.w,
                      ),
                      ChipWidget(tag: news.tag2),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                    width: 200.w,
                    child: Text(
                      news.title,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Signika',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.h),
                child: Image.network(
                  news.image,
                  fit: BoxFit.cover,
                  height: 90.h,
                  width: 90.w,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
