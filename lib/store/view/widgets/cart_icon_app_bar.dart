import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/cart_bloc.dart';
import '../screens/cart_screen.dart';

class CartIconAppBar extends StatelessWidget {
  const CartIconAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, CartScreen.route);
          },
          child: Icon(
            Icons.shopping_bag,
            color: Colors.orange.shade900,
            size: 32.h,
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange.shade100.withOpacity(0.8),
            ),
            constraints: BoxConstraints(
              minWidth: 15.h,
              minHeight: 15.h,
            ),
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartLoadedState) {
                  return Text(
                    state.cartList.length.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
                return const Text(
                  '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
