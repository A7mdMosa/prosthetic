import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prosthetic/store/data/models/order.dart';

import '../screens/order_information_screen.dart';
import '../screens/payment_screen.dart';
import '../../bloc/cart_bloc.dart';
import '../../data/models/cart.dart';

class OrderButton extends StatelessWidget {
  OrderButton({
    Key? key,
  }) : super(key: key);

  List<Cart> cartList = [];
  double total = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      height: 80.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Signika',
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartLoadedState) {
                    cartList = state.cartList;
                    total = 0;
                    for (Cart cart in state.cartList) {
                      total += cart.totalPrice;
                    }
                    return Text(
                      '\$${total.toStringAsFixed(2)}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Signika',
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange.shade900,
                      ),
                    );
                  }
                  return Text(
                    '\$',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Signika',
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.orange.shade900,
                    ),
                  );
                },
              ),
            ],
          ),
          MaterialButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Order Now',
                    style: TextStyle(
                      fontFamily: 'Signika',
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size: 20.h,
                  )
                ],
              ),
              color: Colors.orange.shade800,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.h)),
              minWidth: 200.w,
              height: 45.h,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  OrderInformationScreen.route,
                  arguments: Order(
                      id: DateTime.now().toString(),
                      total: total,
                      userName:
                          FirebaseAuth.instance.currentUser!.email.toString(),
                      cartList: cartList,
                      dateTime: DateTime.now(),
                      city: '',
                      country: '',
                      addressLine1: '',
                      addressLine2: '',
                      phoneNumber: ''),
                );
              })
        ],
      ),
    );
  }
}
