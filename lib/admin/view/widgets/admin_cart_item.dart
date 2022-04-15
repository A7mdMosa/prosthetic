import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../store/data/models/cart.dart';

class AdminCartItem extends StatelessWidget {
  const AdminCartItem({Key? key, required this.cart}) : super(key: key);
  final Cart cart;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
      height: 110.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.h),
        color: Colors.grey.shade400.withOpacity(0.3),
      ),
      child: Row(children: [
        SizedBox(
          height: 100.h,
          width: 80.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.h),
            child: Image.network(
              cart.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 15.w,
        ),
        SizedBox(
          height: 100.h,
          width: 200.w,
          child: Column(
            children: [
              Text(
                cart.title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Signika',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                '${cart.quantity.toString()} x \$${cart.price.toStringAsFixed(2)}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Signika',
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.orange.shade900,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                '\$${(cart.price * cart.quantity).toStringAsFixed(2)}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Signika',
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.orange.shade900,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
