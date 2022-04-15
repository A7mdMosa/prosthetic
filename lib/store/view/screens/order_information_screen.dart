import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:prosthetic/store/bloc/cart_bloc.dart';
import 'package:prosthetic/store/view/screens/payment_screen.dart';

import '../../../admin/view/widgets/new_text_form_field.dart';
import '../../../home/view/widgets/app_title_app_bar.dart';
import '../../../profile/bloc/user_bloc.dart';
import '../../data/models/cart.dart';
import '../../data/models/order.dart';

class OrderInformationScreen extends StatelessWidget {
  static const String route = '/order_information_screen';
  OrderInformationScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey();
  String city = '';
  String country = '';
  String addressLine1 = '';
  String addressLine2 = '';
  String phoneNumber = '';

  Future<void> _submit(BuildContext context, Order order) async {
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      try {
        _formKey.currentState!.save();
        //When payment finished.
        //Add The order.
        //
        // BlocProvider.of<OrderBloc>(context).add(
        //   OrderAddEvent(Order(
        //       id: order.id,
        //       total: order.total,
        //       userName: order.userName,
        //       cartList: order.cartList,
        //       dateTime: order.dateTime,
        //       city: city,
        //       country: country,
        //       addressLine1: addressLine1,
        //       addressLine2: addressLine2,
        //       phoneNumber: phoneNumber)),
        // );
        //
        //Clear all cart data.
        // BlocProvider.of<CartBloc>(context).add(CartClearEvent());
        Navigator.pushNamed(context, PaymentScreen.route);
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Order order = ModalRoute.of(context)!.settings.arguments as Order;
    return Scaffold(
      appBar: AppBar(
        title: const AppTitleAppBar(
          title: 'order information',
          textColor: Colors.black,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Order information',
              style: TextStyle(
                fontFamily: 'Signika',
                fontSize: 25.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5.h),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                return Text(
                  state.userModel.email,
                  style: TextStyle(
                    fontFamily: 'Signika',
                    fontSize: 20.sp,
                    color: Colors.black45,
                  ),
                );
              },
            ),
            Text(
              DateFormat("yyyy-MM-dd   HH:mm").format(DateTime.now()),
              style: TextStyle(
                fontFamily: 'Signika',
                fontSize: 15.sp,
                color: Colors.black45,
              ),
            ),
            SizedBox(height: 5.h),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                double total = 0;
                for (Cart cart in state.cartList) {
                  total += cart.totalPrice;
                }
                return Text(
                  'Total \$${total.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontFamily: 'Signika',
                    fontSize: 20.sp,
                    color: Colors.orange.shade900,
                  ),
                );
              },
            ),
            Expanded(
              child: Form(
                  key: _formKey,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                    child: ListView(
                      children: [
                        NewTextFormField(
                          label: 'City',
                          initialValue: '',
                          onSaved: (value) {
                            city = value!;
                          },
                          textInputType: TextInputType.text,
                        ),
                        NewTextFormField(
                          label: 'Country',
                          initialValue: '',
                          onSaved: (value) {
                            country = value!;
                          },
                          textInputType: TextInputType.text,
                        ),
                        NewTextFormField(
                          label: 'Address Line 1',
                          initialValue: '',
                          onSaved: (value) {
                            addressLine1 = value!;
                          },
                          textInputType: TextInputType.text,
                        ),
                        NewTextFormField(
                          label: 'Address Line 2',
                          initialValue: '',
                          onSaved: (value) {
                            addressLine2 = value!;
                          },
                          textInputType: TextInputType.text,
                        ),
                        NewTextFormField(
                          label: 'Phone number',
                          initialValue: '',
                          onSaved: (value) {
                            phoneNumber = value!;
                          },
                          textInputType: TextInputType.text,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        MaterialButton(
                            child: Text(
                              'Order Now',
                              style: TextStyle(
                                fontFamily: 'Signika',
                                fontSize: 18.sp,
                                color: Colors.white,
                              ),
                            ),
                            color: Colors.orange.shade800,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.h)),
                            minWidth: 200.w,
                            height: 45.h,
                            onPressed: () {
                              _submit(context, order);
                            })
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
