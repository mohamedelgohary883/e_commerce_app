import 'package:e_commerce_app/infrastructure/models/product_model.dart';
import 'package:e_commerce_app/infrastructure/repos/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductRepo productRepo;
  ProductDetailsCubit(this.productRepo) : super(ProductDetailsInitial());

  Future<void> getProductDetails(String id) async {
    emit(ProductDetailsLoading());
    try {
      final result = await productRepo.getProductById(id);
      result.fold(
        (failure) => emit(ProductDetailsFailure(failure.toString())),
        (product) => emit(ProductDetailsSuccess(product)),
      );
    } catch (e) {
      emit(ProductDetailsFailure(e.toString()));
    }
  }
}
