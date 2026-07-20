import 'package:dio/dio.dart';
import 'package:e_commerce_app/infrastructure/models/product_model.dart';

class ApiService {
  final String baseUrl = 'https://accessories-eshop.runasp.net/api/products';
  final Dio dio;
  ApiService(this.dio);

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dio.get(baseUrl);
      final data = response.data as Map<String, dynamic>;
      final items = data['items'] as List<dynamic>;
      return items
          .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw Exception('Failed to load products: ${e.message}');
    }
  }
}
