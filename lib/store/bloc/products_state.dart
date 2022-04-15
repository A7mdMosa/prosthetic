part of 'products_bloc.dart';

@immutable
abstract class ProductsState {
  final List<Product> products;
  const ProductsState(this.products);
}

class ProductsInitial extends ProductsState {
  const ProductsInitial(List<Product> products) : super(products);
}

class ProductsLoadingState extends ProductsState {
  const ProductsLoadingState(List<Product> products) : super(products);
}

class ProductsLoadedState extends ProductsState {
  const ProductsLoadedState(List<Product> products) : super(products);
}

class ProductsSearchingState extends ProductsState {
  const ProductsSearchingState(List<Product> searchedProduct)
      : super(searchedProduct);
}
