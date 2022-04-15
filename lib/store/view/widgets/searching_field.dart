import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/products_bloc.dart';

class SearchingField extends StatelessWidget {
  SearchingField({
    Key? key,
  }) : super(key: key);

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      onChanged: (value) {
        //Search for this value.
        BlocProvider.of<ProductsBloc>(context).add(
          ProductsSearchingEvent(name: value),
        );
      },
      cursorColor: const Color(0xff666666),
      style: TextStyle(
        fontFamily: 'Signika',
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: const Color(0xff666666),
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10.h),
        prefixIcon: InkWell(
          child: Icon(
            Icons.search,
            size: 25.h,
            color: Colors.orange.shade800,
          ),
          onTap: () {
            //Search for this value.
            BlocProvider.of<ProductsBloc>(context).add(
              ProductsSearchingEvent(name: textEditingController.text),
            );
          },
        ),
        suffixIcon: InkWell(
          onTap: () {
            //Clear this text field.
            textEditingController.clear();
            //Loading the products again.
            BlocProvider.of<ProductsBloc>(context).add(
              ProductsLoadingEvent(),
            );
            //Hide the keyboard.
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Icon(
            Icons.close,
            size: 25.h,
            color: Colors.orange.shade800,
          ),
        ),
        hintText: 'Search for products and supplies...',
        hintStyle: TextStyle(
          fontFamily: 'Signika',
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xff999999),
        ),
        filled: true,
        fillColor: Theme.of(context).scaffoldBackgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(color: Colors.orange.shade900, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(color: Colors.orange.shade900, width: 1.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
              color: Colors.orange.shade900.withOpacity(0.1), width: 1.w),
        ),
      ),
    );
  }
}
