import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/view/widgets/app_title_app_bar.dart';
import '../../../store/bloc/order_bloc.dart';
import '../widgets/order_card.dart';

class AdminOrdersScreen extends StatefulWidget {
  static const String route = '/orders_screen';
  const AdminOrdersScreen({Key? key}) : super(key: key);

  @override
  State<AdminOrdersScreen> createState() => _AdminOrdersScreenState();
}

class _AdminOrdersScreenState extends State<AdminOrdersScreen> {
  @override
  void initState() {
    super.initState();
    //Loading Orders.
    BlocProvider.of<OrderBloc>(context).add(
      OrderLoadingEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: const AppTitleAppBar(textColor: Colors.black, title: 'Orders'),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.orders.length,
            itemBuilder: (BuildContext context, int index) {
              return OrderCard(order: state.orders[index]);
            },
          );
        },
      ),
    );
  }
}
