part of 'cart_bloc.dart';

@immutable
abstract class CartState {
  final List<Cart> cartList;
  const CartState(this.cartList);
}

class CartInitial extends CartState {
  const CartInitial(List<Cart> cartList) : super(cartList);
}

class CartLoadingState extends CartState {
  const CartLoadingState(List<Cart> cartList) : super(cartList);
}

class CartLoadedState extends CartState {
  const CartLoadedState(List<Cart> cartList) : super(cartList);
}
