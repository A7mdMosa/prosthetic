import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/admin_cart_item.dart';

import '../../../home/view/widgets/app_title_app_bar.dart';
import '../../../store/data/models/order.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key, required this.order}) : super(key: key);

  final Order order;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: const AppTitleAppBar(
            textColor: Colors.black, title: 'Order Details'),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            '${order.userName}\n${order.phoneNumber}',
            style: TextStyle(
              fontFamily: 'Signika',
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            '\$ ${order.total.toStringAsFixed(2)}',
            style: TextStyle(
              fontFamily: 'Signika',
              fontSize: 25.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            '${order.city}\n${order.country}\n${order.addressLine1}\n${order.addressLine2}',
            style: TextStyle(
              fontFamily: 'Signika',
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: order.cartList.length,
              itemBuilder: (BuildContext context, int index) {
                return AdminCartItem(cart: order.cartList[index]);
              },
            ),
          ),
        ]),
      ),
    );
  }
}
