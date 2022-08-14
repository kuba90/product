/* Local dependencies */
part of 'product_bloc.dart';

class ProductEvent {}

class FetchProductsEvent extends ProductEvent {}

class PrintProductEvent extends ProductEvent {
  final String id;

  PrintProductEvent({required this.id});
}

class DeleteProductEvent extends ProductEvent {
  final String id;

  DeleteProductEvent({required this.id});
}

class AddProductEvent extends ProductEvent {
  final Product product;

  AddProductEvent({required this.product});
}

class UpdateProductEvent extends ProductEvent {
  final String id;
  final Product product;

  UpdateProductEvent({
    required this.id,
    required this.product,
  });
}
