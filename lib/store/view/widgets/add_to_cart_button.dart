import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/cart_bloc.dart';
import '../../data/models/cart.dart';
import '../../data/models/product.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      height: 45.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\$${product.price.toStringAsFixed(2)}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Signika',
              fontSize: 25.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          MaterialButton(
              child: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  //Check if the product in the cart.
                  if (state is CartLoadedState) {
                    String cartButtonLabel = 'Add To Cart';
                    IconData cartButtonIcon = Icons.add_shopping_cart;
                    for (Cart cart in state.cartList) {
                      if (cart.id == product.id) {
                        cartButtonLabel = 'Added';
                        cartButtonIcon = Icons.shopping_cart;
                      }
                    }
                    return Row(
                      children: [
                        Text(
                          cartButtonLabel,
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
                          cartButtonIcon,
                          color: Colors.white,
                          size: 20.h,
                        )
                      ],
                    );
                  }
                  //loading.
                  return Center(
                      child: CircularProgressIndicator(
                    color: Colors.orange.shade900,
                  ));
                },
              ),
              color: Colors.orange.shade800,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.h)),
              minWidth: 200.w,
              height: 45.h,
              onPressed: () {
                //add the product to the cart.
                BlocProvider.of<CartBloc>(context).add(
                  CartAddEvent(
                    newCart: Cart(
                      id: product.id,
                      title: product.title,
                      image: product.image,
                      price: product.price,
                      quantity: 1,
                      totalPrice: product.price * 1,
                    ),
                  ),
                );
                //load the cart item again.
                BlocProvider.of<CartBloc>(context).add(CartLoadingEvent());
              })
        ],
      ),
    );
  }
}
