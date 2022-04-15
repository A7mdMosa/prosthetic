import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../store/data/models/order.dart';

class UserOrderCard extends StatelessWidget {
  const UserOrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);
  final Order order;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
      height: 140.h * order.cartList.length,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.h),
        color: Colors.grey.shade300,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          Expanded(
            child: ListView.builder(
              itemCount: order.cartList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  margin: EdgeInsets.symmetric(vertical: 5.h),
                  height: 110.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.h),
                    color: Colors.grey.shade500.withOpacity(0.3),
                  ),
                  child: Row(children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    SizedBox(
                      height: 100.h,
                      width: 80.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.h),
                        child: Image.network(
                          order.cartList[index].image,
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
                            order.cartList[index].title,
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
                            '${order.cartList[index].quantity.toString()} x \$${order.cartList[index].price.toStringAsFixed(2)}',
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
                            '\$${(order.cartList[index].price * order.cartList[index].quantity).toStringAsFixed(2)}',
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
