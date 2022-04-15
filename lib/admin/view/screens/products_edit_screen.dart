import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/view/widgets/app_title_app_bar.dart';
import '../../../store/bloc/products_bloc.dart';
import '../../../store/data/models/product.dart';
import '../widgets/new_text_form_field.dart';

class ProductsEditScreen extends StatelessWidget {
  ProductsEditScreen({Key? key, required this.product}) : super(key: key);
  final Product product;
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title:
            const AppTitleAppBar(textColor: Colors.black, title: 'Add Product'),
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
                initialValue: product.title,
                onSaved: (value) {
                  product.title = value!;
                },
              ),
              NewTextFormField(
                textInputType: TextInputType.text,
                label: 'image',
                initialValue: product.image,
                onSaved: (value) {
                  product.image = value!;
                },
              ),
              NewTextFormField(
                textInputType: TextInputType.number,
                label: 'price',
                initialValue: product.price.toString(),
                onSaved: (value) {
                  product.price = double.parse(value!);
                },
              ),
              NewTextFormField(
                textInputType: TextInputType.text,
                label: 'Description1',
                initialValue: product.description1,
                onSaved: (value) {
                  product.description1 = value!;
                },
              ),
              NewTextFormField(
                textInputType: TextInputType.text,
                label: 'Description2',
                initialValue: product.description2,
                onSaved: (value) {
                  product.description2 = value!;
                },
              ),
              NewTextFormField(
                textInputType: TextInputType.text,
                label: 'Description3',
                initialValue: product.description3,
                onSaved: (value) {
                  product.description3 = value!;
                },
              ),
              NewTextFormField(
                textInputType: TextInputType.text,
                label: 'Description4',
                initialValue: product.description4,
                onSaved: (value) {
                  product.description4 = value!;
                },
              ),
              NewTextFormField(
                textInputType: TextInputType.text,
                label: 'Description5',
                initialValue: product.description5,
                onSaved: (value) {
                  product.description5 = value!;
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
                      if (product.id == '') {
                        print('new product');
                        //add new product.
                        BlocProvider.of<ProductsBloc>(context).add(
                          ProductsAddEvent(newProduct: product),
                        );
                        //loading products after editing.
                        BlocProvider.of<ProductsBloc>(context)
                            .add(ProductsLoadingEvent());
                      } else {
                        //update this product.
                        BlocProvider.of<ProductsBloc>(context).add(
                          ProductsUpdateEvent(updatedProduct: product),
                        );
                        //loading products after editing.
                        BlocProvider.of<ProductsBloc>(context)
                            .add(ProductsLoadingEvent());
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
