part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent {}

class ProductsLoadingEvent extends ProductsEvent {}

class ProductsAddEvent extends ProductsEvent {
  final Product newProduct;
  ProductsAddEvent({required this.newProduct});
}

class ProductsUpdateEvent extends ProductsEvent {
  final Product updatedProduct;
  ProductsUpdateEvent({required this.updatedProduct});
}

class ProductsDeleteEvent extends ProductsEvent {
  final Product oldProduct;
  ProductsDeleteEvent({required this.oldProduct});
}

class ProductsSearchingEvent extends ProductsEvent {
  final String name;
  ProductsSearchingEvent({required this.name});
}
