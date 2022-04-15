import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/cart_bloc.dart';
import '../../data/models/cart.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({Key? key, required this.cart}) : super(key: key);
  final Cart cart;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
      height: 110.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.h),
        color: Colors.orange.shade100.withOpacity(0.3),
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
          width: 120.w,
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
              //price.
              Text(
                '\$${cart.price.toStringAsFixed(2)}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Signika',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              //total
              Text(
                '\$${(cart.price * cart.quantity).toStringAsFixed(2)}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Signika',
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.orange.shade900,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 25.w,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text(
                              'ARE YOU SURE ?',
                              style: TextStyle(
                                fontFamily: 'Signika',
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.orange.shade900,
                              ),
                            ),
                            content: Text(
                              'Do you want remove this item ?',
                              style: TextStyle(
                                fontFamily: 'Signika',
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: Text(
                                  'YES',
                                  style: TextStyle(
                                    fontFamily: 'Signika',
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.orange.shade900,
                                  ),
                                ),
                                onPressed: () {
                                  //delete cart item.
                                  BlocProvider.of<CartBloc>(context).add(
                                    CartDeleteEvent(oldCart: cart),
                                  );
                                  //load the cart item again.
                                  BlocProvider.of<CartBloc>(context)
                                      .add(CartLoadingEvent());
                                  Navigator.pop(context);
                                },
                              ),
                              TextButton(
                                child: Text(
                                  'NO',
                                  style: TextStyle(
                                    fontFamily: 'Signika',
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ));
                },
                child: Icon(
                  Icons.clear,
                  size: 20.h,
                  color: Colors.red.shade800,
                )),
            Container(
              height: 30.h,
              width: 80.w,
              padding: EdgeInsets.all(4.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.h),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        if (cart.quantity > 1) {
                          //update quantity.
                          BlocProvider.of<CartBloc>(context).add(
                            CartUpdateEvent(
                              updatedCart: Cart(
                                  id: cart.id,
                                  title: cart.title,
                                  image: cart.image,
                                  price: cart.price,
                                  quantity: cart.quantity - 1,
                                  totalPrice: cart.price * cart.quantity),
                            ),
                          );
                          //load cart item.
                          BlocProvider.of<CartBloc>(context)
                              .add(CartLoadingEvent());
                        }
                      },
                      child: Icon(
                        Icons.remove,
                        size: 20.h,
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Text(
                      cart.quantity.toString(),
                      style: TextStyle(
                        fontFamily: 'Signika',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        if (cart.quantity < 100) {
                          //update quantity.
                          BlocProvider.of<CartBloc>(context).add(
                            CartUpdateEvent(
                              updatedCart: Cart(
                                  id: cart.id,
                                  title: cart.title,
                                  image: cart.image,
                                  price: cart.price,
                                  quantity: cart.quantity + 1,
                                  totalPrice: cart.price * cart.quantity),
                            ),
                          );
                          //load cart items again.
                          BlocProvider.of<CartBloc>(context)
                              .add(CartLoadingEvent());
                        }
                      },
                      child: Icon(
                        Icons.add,
                        size: 20.h,
                      )),
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}
