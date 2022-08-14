/* External dependencies */
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

/* Local dependencies */
import '../../models/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  Box<Product> productHive;
  ProductBloc(this.productHive) : super(ProductState()) {
    on<FetchProductsEvent>((event, emit) async {
      emit(state.cloneWith(loading: true));
      emit(await _fetchProductList());
    });

    on<AddProductEvent>((event, emit) async {
      emit(state.cloneWith(loading: true));
      emit(await _addProduct(event.product));
    });

    on<UpdateProductEvent>((event, emit) async {
      emit(state.cloneWith(loading: true));
      emit(
        await _updateProduct(
          event.id,
          event.product,
        ),
      );
    });

    on<DeleteProductEvent>((event, emit) async {
      emit(state.cloneWith(loading: true));
      emit(await _deleteProductList(event.id));
    });
  }

  Future<ProductState> _addProduct(Product product) async {
    await productHive.add(product);

    final List<Product> list = List.from(state.listProducts);
    list.add(product);

    return state.cloneWith(
      listProduct: list,
      loading: false,
    );
  }

  Future<ProductState> _updateProduct(String id, Product product) async {
    int productIndex =
        state.listProducts.indexWhere((element) => element.id == id);

    await productHive.put(productIndex, product);

    final List<Product> list = List.from(state.listProducts);
    list[productIndex] = product;

    return state.cloneWith(
      listProduct: list,
      loading: false,
    );
  }

  Future<ProductState> _deleteProductList(String id) async {
    int productIndex =
        state.listProducts.indexWhere((element) => element.id == id);
    await productHive.deleteAt(productIndex);
    final List<Product> list = List.from(state.listProducts);
    list.removeAt(productIndex);

    return state.cloneWith(
      listProduct: list,
      loading: false,
    );
  }

  Future<ProductState> _fetchProductList() async {
    List<Product>? products = productHive.values.toList();

    try {
      return state.cloneWith(
        listProduct: products,
        loading: false,
      );
    } catch (e) {
      throw e.toString();
    }
  }
}
