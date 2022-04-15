import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/new_text_form_field.dart';
import '../../../news/bloc/articles_bloc.dart';
import '../../../news/data/models/article_model.dart';
import '../../../home/view/widgets/app_title_app_bar.dart';

class ArticlesEditScreen extends StatelessWidget {
  ArticlesEditScreen({Key? key, required this.article}) : super(key: key);
  final Article article;
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title:
            const AppTitleAppBar(textColor: Colors.black, title: 'Add Article'),
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
                initialValue: article.title,
                onSaved: (value) {
                  article.title = value!;
                },
              ),
              NewTextFormField(
                textInputType: TextInputType.text,
                label: 'Description',
                initialValue: article.description,
                onSaved: (value) {
                  article.description = value!;
                },
              ),
              NewTextFormField(
                textInputType: TextInputType.text,
                label: 'Tag1',
                initialValue: article.tag1,
                onSaved: (value) {
                  article.tag1 = value!;
                },
              ),
              NewTextFormField(
                textInputType: TextInputType.text,
                label: 'Tag2',
                initialValue: article.tag2,
                onSaved: (value) {
                  article.tag2 = value!;
                },
              ),
              NewTextFormField(
                textInputType: TextInputType.text,
                label: 'Article',
                initialValue: article.article,
                onSaved: (value) {
                  article.article = value!;
                },
              ),
              NewTextFormField(
                textInputType: TextInputType.text,
                label: 'Image url',
                initialValue: article.image,
                onSaved: (value) {
                  article.image = value!;
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
                      if (article.id == '') {
                        print('this is a new product.');
                        //add new article.
                        BlocProvider.of<ArticlesBloc>(context).add(
                          ArticlesAddEvent(newArticle: article),
                        );
                        //loading articles after edit.
                        BlocProvider.of<ArticlesBloc>(context)
                            .add(ArticlesLoadingEvent());
                      } else {
                        //update product.
                        BlocProvider.of<ArticlesBloc>(context).add(
                          ArticlesUpdateEvent(updatedArticle: article),
                        );
                        //loading articles after edit.
                        BlocProvider.of<ArticlesBloc>(context)
                            .add(ArticlesLoadingEvent());
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
