/* Local dependencies */
part of 'product_bloc.dart';

class ProductState extends Equatable {
  List<Product> listProducts = [];

  bool loading;

  ProductState({
    this.listProducts = const <Product>[],
    this.loading = false,
  });

  ProductState cloneWith({
    List<Product>? listProduct,
    bool? loading,
  }) {
    return ProductState(
      listProducts: listProduct ?? this.listProducts,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object> get props => [listProducts, loading];
}
