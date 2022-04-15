import 'package:bloc/bloc.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import '../data/repository/cart_repository.dart';

import '../data/models/cart.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _cartRepository;
  List<Cart> cartList = [];
  CartBloc(this._cartRepository) : super(const CartInitial([])) {
    on<CartEvent>((event, emit) {});
    on<CartLoadingEvent>((event, emit) async {
      try {
        //Get cart snapshot.
        QuerySnapshot querySnapshot = await _cartRepository.getCartDocs();
        final List<Cart> _newCartList = [];
        //A list of cart items.
        for (int i = 0; i < querySnapshot.docs.length; i++) {
          var snapshot = querySnapshot.docs[i];
          _newCartList.add(
            Cart.fromSnapshot(snapshot),
          );
        }
        cartList = _newCartList;
        print('cart Added');
      } catch (e) {
        print(e.toString());
      }
      emit(CartLoadedState(cartList));
      print('cartLoadedState');
    });

    on<CartAddEvent>((event, emit) async {
      try {
        emit(CartLoadingState(cartList));
        await _cartRepository.addCartData(event.newCart);
        print('cart Added');
      } catch (e) {
        print(e.toString());
      }
      emit(CartLoadedState(cartList));
      print('cartLoadedState');
    });
    on<CartUpdateEvent>((event, emit) async {
      try {
        await _cartRepository.updateCartData(event.updatedCart);
        print('cart updated');
      } catch (e) {
        print(e.toString());
      }
      emit(CartLoadedState(cartList));
      print('cartLoadedState');
    });

    on<CartDeleteEvent>((event, emit) async {
      try {
        await _cartRepository.deleteCartData(event.oldCart);
        print('cart deleted');
      } catch (e) {
        print(e.toString());
      }
      emit(CartLoadedState(cartList));
      print('cartLoadedState');
    });

    on<CartClearEvent>((event, emit) async {
      try {
        await _cartRepository.clearCartData();
        print('cart clear');
        cartList = [];
      } catch (e) {
        print(e.toString());
      }
      emit(CartLoadedState(cartList));
      print('cartLoadedState');
    });
  }
}
