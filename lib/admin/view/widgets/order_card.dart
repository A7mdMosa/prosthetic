import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../store/data/models/order.dart';
import '../screens/order_details_screen.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);
  final Order order;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) {
              return OrderDetailsScreen(
                order: order,
              );
            }),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        height: 70.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.h),
          color: Colors.orange.shade100.withOpacity(0.3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat("yyyy-MM-dd   HH:mm").format(order.dateTime),
                    style: TextStyle(
                      fontFamily: 'Signika',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.orange.shade900,
                    ),
                  ),
                  Text(
                    order.userName,
                    style: TextStyle(
                      fontFamily: 'Signika',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade900,
                    ),
                  )
                ]),
            Text(
              '\$${order.total.toStringAsFixed(2)}',
              style: TextStyle(
                fontFamily: 'Signika',
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade900,
              ),
            )
          ],
        ),
      ),
    );
  }
}
