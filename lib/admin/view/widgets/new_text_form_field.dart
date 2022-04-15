import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewTextFormField extends StatelessWidget {
  const NewTextFormField({
    Key? key,
    required this.label,
    required this.initialValue,
    required this.onSaved,
    required this.textInputType,
  }) : super(key: key);

  final String label;
  final String initialValue;
  final TextInputType textInputType;
  final Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: TextFormField(
        onSaved: onSaved,
        cursorColor: Colors.orange.shade900,
        initialValue: initialValue,
        textInputAction: TextInputAction.next,
        style: TextStyle(
          fontSize: 15.sp,
        ),
        keyboardType: textInputType,
        validator: (value) {
          if (value == '') {
            return 'Please fill the $label field';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          labelStyle: TextStyle(
            fontSize: 18.sp,
            color: Colors.orange.shade900,
          ),
          label: Text(label),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.h),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.h),
            borderSide: BorderSide(
              color: Colors.orange.shade900,
            ),
          ),
        ),
      ),
    );
  }
}
