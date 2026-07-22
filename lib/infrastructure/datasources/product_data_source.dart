import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/core/network/api_service.dart';
import 'package:e_commerce_app/infrastructure/models/product_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class ProductDataSource {
  Future<Either<Failure, List<ProductModel>>> getProducts();
  Future<Either<Failure, ProductModel>> getProductById(String id);
}

class ProductDataSourceImpl implements ProductDataSource {
  final ApiService apiService;
  ProductDataSourceImpl(this.apiService);

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      final response = await apiService.get('/products');
      final data = response.data as Map<String, dynamic>;
      final items = data['items'] as List<dynamic>;
      final products = items
          .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
          .toList();
      return Right(products);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProductById(String id) async {
    try {
      final response = await apiService.get('/products/$id');
      final product = ProductModel.fromJson(
        response.data as Map<String, dynamic>,
      );
      return Right(product);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
