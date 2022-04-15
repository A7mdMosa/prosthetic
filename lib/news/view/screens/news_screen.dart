import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../profile/bloc/user_bloc.dart';
import '../widgets/news_card.dart';
import '/news/bloc/news_bloc.dart';
import '/news/bloc/articles_bloc.dart';
import '/news/view/widgets/article_card.dart';
import '/home/view/widgets/profile_icon_appBar.dart';
import '/profile/bloc/profile_image_bloc.dart';
import '../../../home/view/widgets/app_title_app_bar.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    //Loading news.
    BlocProvider.of<NewsBloc>(context).add(NewsLoadingEvent());
    //Loading articles.
    BlocProvider.of<ArticlesBloc>(context).add(ArticlesLoadingEvent());
    //Loading User Data.
    BlocProvider.of<UserBloc>(context).add(UserLoadingEvent());
    //Loading profile image.
    BlocProvider.of<ProfileImageBloc>(context).add(ProfileImageGetEvent());
  }

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              AppTitleAppBar(
                title: 'News',
                textColor: Colors.black,
              ),
              ProfileIconAppBar(),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            DateFormat.MMMMEEEEd().format(
              DateTime.now(),
            ),
            style: TextStyle(
              fontFamily: 'Signika',
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xff7B7B7B).withOpacity(0.6),
            ),
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return Text(
                'Welcome, ${state.userModel.firstName}',
                style: TextStyle(
                  fontFamily: 'Signika',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.7),
                ),
              );
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          //Article Building.
          BlocBuilder<ArticlesBloc, ArticlesState>(
            builder: (context, state) {
              if (state is ArticlesLoadedState) {
                return Center(
                  child: Column(children: [
                    SizedBox(
                      height: 180.h,
                      width: 355.w,
                      child: PageView.builder(
                          onPageChanged: (index) {
                            setState(() {
                              currentPage = index;
                            });
                          },
                          itemCount: state.articles.length,
                          itemBuilder: (context, index) {
                            currentPage = index;
                            return ArticleCard(article: state.articles[index]);
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: DotsIndicator(
                        dotsCount: state.articles.length,
                        position: currentPage.toDouble(),
                        decorator: DotsDecorator(
                          spacing: EdgeInsets.symmetric(horizontal: 1.w),
                          color: Colors.black.withOpacity(0.2),
                          size: Size(12.h, 8.w),
                          shape: const CircleBorder(),
                          activeColor: Colors.black.withOpacity(0.6),
                          activeSize: Size(20.h, 10.w),
                          activeShape: const CircleBorder(),
                        ),
                      ),
                    ),
                  ]),
                );
              }
              //Loading
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.orange.shade900,
                ),
              );
            },
          ),
          SizedBox(
            height: 12.h,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Just For You',
                  style: TextStyle(
                    fontFamily: 'Signika',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff7B7B7B),
                  ),
                ),
                //News building.
                BlocBuilder<NewsBloc, NewsState>(
                  builder: (context, state) {
                    if (state is NewsLoadedState) {
                      return Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: state.news.length,
                            itemBuilder: (context, index) {
                              return NewsCard(news: state.news[index]);
                            }),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.orange.shade900,
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
