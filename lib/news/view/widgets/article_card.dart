import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/article_model.dart';
import '../screens/article_details_screen.dart';
import 'chip_widget.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    Key? key,
    required this.article,
  }) : super(key: key);
  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //Article Details
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailsScreen(
              article: article,
            ),
          ),
        );
      },
      child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(article.image), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(15.h),
          ),
          child: Stack(
            children: [
              Positioned(
                  top: 1.h,
                  right: 5.w,
                  child: Row(
                    children: [
                      ChipWidget(tag: article.tag1),
                      SizedBox(
                        width: 5.w,
                      ),
                      ChipWidget(tag: article.tag2),
                    ],
                  )),
              Positioned(
                top: 80.h,
                left: 20.w,
                child: SizedBox(
                  height: 100.h,
                  width: 120.w,
                  child: Text(
                    article.title,
                    maxLines: 4,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Signika',
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
