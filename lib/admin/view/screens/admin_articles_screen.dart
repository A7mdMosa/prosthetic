import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'articles_edit_screen.dart';
import '../widgets/edit_card_widget.dart';
import '../../../home/view/widgets/app_title_app_bar.dart';
import '../../../news/bloc/articles_bloc.dart';
import '../../../news/data/models/article_model.dart';

class AdminArticlesScreen extends StatefulWidget {
  static const String route = '/articles_screen';
  const AdminArticlesScreen({Key? key}) : super(key: key);

  @override
  State<AdminArticlesScreen> createState() => _AdminArticlesScreenState();
}

class _AdminArticlesScreenState extends State<AdminArticlesScreen> {
  @override
  void initState() {
    super.initState();
    //Load articles.
    BlocProvider.of<ArticlesBloc>(context).add(ArticlesLoadingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: const AppTitleAppBar(
              textColor: Colors.black, title: 'Edit Articles'),
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
                    'Add Article',
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
                    //add new article, pass empty article.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticlesEditScreen(
                            article: Article(
                                id: '',
                                title: '',
                                description: '',
                                article: '',
                                image: '',
                                tag1: '',
                                tag2: '')),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: BlocBuilder<ArticlesBloc, ArticlesState>(
                builder: (context, state) {
                  if (state is ArticlesLoadedState) {
                    return ListView.builder(
                      itemCount: state.articles.length,
                      itemBuilder: (BuildContext context, int index) {
                        return EditCardWidget(
                            title: state.articles[index].title,
                            image: state.articles[index].image,
                            edit: () {
                              //edit this article.
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ArticlesEditScreen(
                                      article: state.articles[index]),
                                ),
                              );
                            },
                            //delete this article.
                            delete: () {
                              BlocProvider.of<ArticlesBloc>(context).add(
                                ArticlesDeleteEvent(
                                    oldArticle: state.articles[index]),
                              );
                              //loading articles after delete.
                              BlocProvider.of<ArticlesBloc>(context)
                                  .add(ArticlesLoadingEvent());
                              Navigator.pop(context);
                            });
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
