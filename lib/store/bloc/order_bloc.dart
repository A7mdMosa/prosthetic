import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import '../data/repository/order_repository.dart';

import '../data/models/order.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository _orderRepository;
  List<Order> orders = [];
  OrderBloc(this._orderRepository) : super(const OrderInitial([])) {
    on<OrderEvent>((event, emit) {});

    on<OrderLoadingEvent>(((event, emit) async {
      try {
        //get products snapshot.
        QuerySnapshot querySnapshot = await _orderRepository.getDocs();
        final List<Order> _newOrders = [];
        for (int i = 0; i < querySnapshot.docs.length; i++) {
          var snapshot = querySnapshot.docs[i];
          print(snapshot);
          _newOrders.add(
            Order.fromSnapshot(snapshot),
          );
        }
        orders = _newOrders;
        print('orders Added');
        print(orders.length);
      } catch (e) {
        print(e.toString());
      }
      emit(
        OrderLoadingState(orders),
      );
    }));

    on<OrderGetDataEvent>((event, emit) async {
      try {
        //Get orders data.
        QuerySnapshot querySnapshot = await _orderRepository.getUserDocs();
        final List<Order> _newOrders = [];
        for (int i = 0; i < querySnapshot.docs.length; i++) {
          var snapshot = querySnapshot.docs[i];
          print(snapshot);
          _newOrders.add(
            Order.fromSnapshot(snapshot),
          );
        }
        orders = _newOrders;
        print('orders added');
      } catch (e) {
        print(e);
      }
      emit(
        OrderUserLoadingState(orders),
      );
      print('User orders loaded');
    });

    on<OrderAddEvent>((event, emit) async {
      try {
        await _orderRepository.addOrderData(event.order);
        print('order Added');
      } catch (e) {
        print(e.toString());
      }
      emit(
        OrderLoadingState(orders),
      );
      print('ordersLoadedState');
    });
  }
}
