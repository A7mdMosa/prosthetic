import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/cart_bloc.dart';
import '../widgets/order_button.dart';
import '../widgets/cart_item_widget.dart';
import '../../../home/view/widgets/profile_icon_appBar.dart';

class CartScreen extends StatefulWidget {
  static const String route = '/cart_screen';
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    //Loading cart items.
    BlocProvider.of<CartBloc>(context).add(CartLoadingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(5.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackButton(
                  color: Colors.black,
                ),
                Text(
                  'My cart',
                  style: TextStyle(
                    fontFamily: 'Signika',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const ProfileIconAppBar(),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child:
                  //cart items building.
                  BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                if (state is CartLoadedState) {
                  return ListView.builder(
                      itemCount: state.cartList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CartItemWidget(
                          cart: state.cartList[index],
                        );
                      });
                }
                //Loading...
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              }),
            ),
            OrderButton()
          ]),
        ),
      ),
    );
  }
}
