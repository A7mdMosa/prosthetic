import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../news/data/models/news_model.dart';
import '../../../home/view/widgets/app_title_app_bar.dart';
import '../../../news/bloc/news_bloc.dart';
import '../widgets/new_text_form_field.dart';

class NewsEditScreen extends StatelessWidget {
  NewsEditScreen({Key? key, required this.news}) : super(key: key);
  final News news;
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: const AppTitleAppBar(textColor: Colors.black, title: 'Add News'),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              NewTextFormField(
                textInputType: TextInputType.text,
                label: 'Title',
                initialValue: news.title,
                onSaved: (value) {
                  news.title = value!;
                },
              ),
              NewTextFormField(
                textInputType: TextInputType.text,
                label: 'Tag1',
                initialValue: news.tag1,
                onSaved: (value) {
                  news.tag1 = value!;
                },
              ),
              NewTextFormField(
                textInputType: TextInputType.text,
                label: 'Tag2',
                initialValue: news.tag2,
                onSaved: (value) {
                  news.tag2 = value!;
                },
              ),
              NewTextFormField(
                textInputType: TextInputType.text,
                label: 'Url',
                initialValue: news.url,
                onSaved: (value) {
                  news.url = value!;
                },
              ),
              NewTextFormField(
                textInputType: TextInputType.text,
                label: 'Image url',
                initialValue: news.image,
                onSaved: (value) {
                  news.image = value!;
                },
              ),
              MaterialButton(
                  child: Text(
                    'Save',
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
                    if (_form.currentState!.validate()) {
                      _form.currentState!.save();
                      if (news.id == '') {
                        print('this is a new news');
                        //add new news.
                        BlocProvider.of<NewsBloc>(context).add(
                          NewsAddEvent(newNews: news),
                        );
                        //loading news after edit.
                        BlocProvider.of<NewsBloc>(context)
                            .add(NewsLoadingEvent());
                      } else {
                        //update this news.
                        BlocProvider.of<NewsBloc>(context).add(
                          NewsUpdateEvent(updatedNews: news),
                        );
                        //loading news after edit.
                        BlocProvider.of<NewsBloc>(context)
                            .add(NewsLoadingEvent());
                      }
                      Navigator.pop(context);
                      print('valid');
                    } else {
                      print('not valid');
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
