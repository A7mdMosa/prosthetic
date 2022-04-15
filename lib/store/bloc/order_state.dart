part of 'order_bloc.dart';

@immutable
abstract class OrderState {
  final List<Order> orders;
  const OrderState(this.orders);
}

class OrderInitial extends OrderState {
  const OrderInitial(List<Order> orders) : super(orders);
}

class OrderLoadingState extends OrderState {
  const OrderLoadingState(List<Order> orders) : super(orders);
}

class OrderUserLoadingState extends OrderState {
  const OrderUserLoadingState(List<Order> orders) : super(orders);
}

class OrderLoadedState extends OrderState {
  const OrderLoadedState(List<Order> orders) : super(orders);
}
