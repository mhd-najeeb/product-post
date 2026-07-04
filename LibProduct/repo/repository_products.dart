import 'package:experiemce7/services/api_services.dart';

import '../model/product_model.dart';

class RepositoryProducts {
  final ApiServices apiServices;
  RepositoryProducts(this.apiServices);
  Future<List<ProductModel>> getProducts() async {
    final List<dynamic> jsonList = await apiServices.getProducts();
    return jsonList.map((json) => ProductModel.fromJson(json)).toList();
  }
}
