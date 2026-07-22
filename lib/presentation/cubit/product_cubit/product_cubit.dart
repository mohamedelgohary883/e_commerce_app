import 'package:e_commerce_app/infrastructure/models/product_model.dart';
import 'package:e_commerce_app/infrastructure/repos/product_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo productRepo;
  ProductCubit(this.productRepo) : super(ProductInitial());

  Future<void> getProducts() async {
    emit(ProductLoading());
    try {
      final result = await productRepo.getProducts();
      result.fold(
        (failure) => emit(ProductFailure(failure.toString())),
        (products) => emit(ProductSuccess(products)),
      );
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }
}
