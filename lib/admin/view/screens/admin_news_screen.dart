import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'news_edit_screen.dart';
import '../widgets/edit_card_widget.dart';
import '../../../news/bloc/news_bloc.dart';
import '../../../news/data/models/news_model.dart';
import '../../../home/view/widgets/app_title_app_bar.dart';

class AdminNewsScreen extends StatefulWidget {
  static const String route = '/news_screen';
  const AdminNewsScreen({Key? key}) : super(key: key);

  @override
  State<AdminNewsScreen> createState() => _AdminNewsScreenState();
}

class _AdminNewsScreenState extends State<AdminNewsScreen> {
  @override
  void initState() {
    super.initState();
    //Loading news.
    BlocProvider.of<NewsBloc>(context).add(NewsLoadingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title:
              const AppTitleAppBar(textColor: Colors.black, title: 'Edit News'),
          leading: const BackButton(
            color: Colors.black,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
              child: MaterialButton(
                  child: Text(
                    'Add News',
                    style: TextStyle(
                      fontFamily: 'Signika',
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  color: Colors.orange.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.h),
                  ),
                  minWidth: 370.w,
                  height: 60.h,
                  onPressed: () {
                    //add new news screen and pass empty news.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsEditScreen(
                          news: News(
                              id: '',
                              image: '',
                              tag1: '',
                              tag2: '',
                              title: '',
                              url: ''),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: BlocBuilder<NewsBloc, NewsState>(
                builder: (context, state) {
                  if (state is NewsLoadedState) {
                    return ListView.builder(
                      itemCount: state.news.length,
                      itemBuilder: (BuildContext context, int index) {
                        return EditCardWidget(
                          //delete this news.
                          delete: () {
                            BlocProvider.of<NewsBloc>(context).add(
                              NewsDeleteEvent(oldNews: state.news[index]),
                            );
                            //loading news after delete.
                            BlocProvider.of<NewsBloc>(context)
                                .add(NewsLoadingEvent());
                            Navigator.pop(context);
                          },
                          edit: () {
                            //edit this news.
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NewsEditScreen(news: state.news[index]),
                              ),
                            );
                          },
                          title: state.news[index].title,
                          image: state.news[index].image,
                        );
                      },
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange.shade900,
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
