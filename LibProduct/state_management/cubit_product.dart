import 'package:experiemce7/state_management/state_product.dart';

import '../repo/repository_products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  final RepositoryProducts repositoryProducts;
  ProductCubit(this.repositoryProducts) : super(InitialState());
  Future<dynamic> getProduct() async {
    emit(LoadingState());
    try {
      final productModel = await repositoryProducts.getProducts();
      emit(SuccessState(productModel, "success"));
    } catch (e) {
      emit(FailedState(e.toString()));
      print(e);
    }
  }
}
