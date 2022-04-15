import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextInputField extends StatelessWidget {
  const TextInputField(
      {Key? key,
      required this.title,
      required this.onSave,
      required this.onChange,
      required this.validator,
      required this.obscureText,
      required this.textInputType})
      : super(key: key);

  final String title;
  final Function(String?) onSave;
  final Function(String?) onChange;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      child: TextFormField(
        obscureText: obscureText,
        style: TextStyle(
          fontFamily: 'Signika',
          fontSize: 17.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black54,
        ),
        decoration: InputDecoration(
          labelStyle: TextStyle(fontSize: 15.sp),
          label: Text(
            title,
            style: TextStyle(
              fontFamily: 'Signika',
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0XFFFFBB7E),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.orange.shade700,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.orange.shade700, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Colors.orange.shade700,
            ),
          ),
        ),
        keyboardType: textInputType,
        validator: validator,
        onSaved: onSave,
        onChanged: onChange,
      ),
    );
  }
}
