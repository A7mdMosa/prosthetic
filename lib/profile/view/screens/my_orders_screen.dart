import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/user_order_card.dart';
import '../../../store/bloc/order_bloc.dart';
import '../../../home/view/widgets/app_title_app_bar.dart';

class MyOrdersScreen extends StatefulWidget {
  static const String route = '/my_orders_screen';
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  void initState() {
    super.initState();
    //Loading orders.
    BlocProvider.of<OrderBloc>(context).add(OrderGetDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title:
            const AppTitleAppBar(textColor: Colors.black, title: 'My Orders'),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.orders.length,
            itemBuilder: (BuildContext context, int index) {
              return UserOrderCard(order: state.orders[index]);
            },
          );
        },
      ),
    );
  }
}
