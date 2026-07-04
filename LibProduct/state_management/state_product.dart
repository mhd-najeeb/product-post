import 'package:experiemce7/model/product_model.dart';

abstract class ProductState {}

class InitialState extends ProductState {}

class LoadingState extends ProductState {}

class SuccessState extends ProductState {
  final List<ProductModel> productModel;
  final String message;
  SuccessState(this.productModel, this.message);
}

class FailedState extends ProductState {
  final String message;
  FailedState(this.message);
}
