part of 'order_bloc.dart';

@immutable
abstract class OrderEvent {}

class OrderAddEvent extends OrderEvent {
  final Order order;
  OrderAddEvent(this.order);
}

class OrderLoadingEvent extends OrderEvent {}

class OrderGetDataEvent extends OrderEvent {}

class OrderDeleteEvent extends OrderEvent {}
