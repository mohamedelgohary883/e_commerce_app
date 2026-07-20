import 'package:e_commerce_app/core/network/api_service.dart';
import 'package:e_commerce_app/infrastructure/models/product_model.dart';

class ProductRepo {
  final ApiService apiService;
  ProductRepo(this.apiService);

  Future<List<ProductModel>> getProducts() async {
    return await apiService.getProducts();
  }
}
