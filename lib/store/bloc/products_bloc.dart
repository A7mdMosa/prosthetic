import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../data/models/product.dart';
import '../data/repository/products_repository.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository _productsRepository;
  List<Product> products = [];
  ProductsBloc(this._productsRepository) : super(const ProductsInitial([])) {
    on<ProductsEvent>((event, emit) {});
    on<ProductsLoadingEvent>((event, emit) async {
      try {
        //Get products snapshot.
        QuerySnapshot querySnapshot =
            await _productsRepository.getProductsDocs();
        final List<Product> _newProducts = [];
        //A list of products.
        for (int i = 0; i < querySnapshot.docs.length; i++) {
          var snapshot = querySnapshot.docs[i];
          _newProducts.add(
            Product.fromSnapshot(snapshot),
          );
        }
        products = _newProducts;
        print('products Added');
      } catch (e) {
        print(e.toString());
      }
      emit(ProductsLoadedState(products));
      print('ProductsLoadedState');
    });

    on<ProductsAddEvent>((event, emit) async {
      try {
        await _productsRepository.addProductData(event.newProduct);
        print('Products Added');
      } catch (e) {
        print(e.toString());
      }
      emit(ProductsLoadedState(products));
      print('ProductsLoadedState');
    });
    on<ProductsUpdateEvent>((event, emit) async {
      try {
        await _productsRepository.updateProductData(event.updatedProduct);
        print('products updated');
      } catch (e) {
        print(e.toString());
      }
      emit(ProductsLoadedState(products));
      print('ProductsLoadedState');
    });

    on<ProductsDeleteEvent>((event, emit) async {
      try {
        await _productsRepository.deleteProductData(event.oldProduct);
        print('products deleted');
      } catch (e) {
        print(e.toString());
      }
      emit(ProductsLoadedState(products));
      print('ProductsLoadedState');
    });
    on<ProductsSearchingEvent>((event, emit) async {
      List<Product> searchedProduct = [];
      try {
        emit(
          ProductsLoadingState(searchedProduct),
        );
        searchedProduct = products
            .where((element) =>
                element.title.toLowerCase().contains(event.name.toLowerCase()))
            .toList();
      } catch (e) {
        print(e.toString());
      }
      emit(
        ProductsSearchingState(searchedProduct),
      );
      print('productsSearchingState');
    });
  }
}
