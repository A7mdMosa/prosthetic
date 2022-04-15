part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartLoadingEvent extends CartEvent {}

class CartAddEvent extends CartEvent {
  final Cart newCart;
  CartAddEvent({required this.newCart});
}

class CartUpdateEvent extends CartEvent {
  final Cart updatedCart;
  CartUpdateEvent({required this.updatedCart});
}

class CartDeleteEvent extends CartEvent {
  final Cart oldCart;
  CartDeleteEvent({required this.oldCart});
}

class CartClearEvent extends CartEvent {
  CartClearEvent();
}
