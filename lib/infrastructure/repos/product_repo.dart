import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/infrastructure/datasources/product_data_source.dart';
import 'package:e_commerce_app/infrastructure/models/product_model.dart';
import 'package:fpdart/fpdart.dart';

class ProductRepo {
  final ProductDataSource remoteDataSource;
  ProductRepo(this.remoteDataSource);

  Future<Either<Failure, List<ProductModel>>> getProducts() {
    return remoteDataSource.getProducts();
  }

  Future<Either<Failure, ProductModel>> getProductById(String id) {
    return remoteDataSource.getProductById(id);
  }
}
