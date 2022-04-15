import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/view/widgets/app_title_app_bar.dart';
import '../../data/models/article_model.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            expandedHeight: 250.h,
            pinned: true,
            elevation: 5,
            title: const AppTitleAppBar(
              title: 'News',
              textColor: Colors.white,
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                article.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(children: [
                    Row(
                      children: [
                        Chip(
                          backgroundColor: Colors.black54,
                          label: Text(
                            article.tag1,
                            style: TextStyle(
                              fontFamily: 'Signika',
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Chip(
                          backgroundColor: Colors.black54,
                          label: Text(
                            article.tag2,
                            style: TextStyle(
                              fontFamily: 'Signika',
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      article.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Signika',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      article.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Signika',
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      article.article,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      maxLines: 100,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Signika',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
