import 'package:e_commerce_app/presentation/cubit/product_deatils_cubit/product_details_cubit.dart';
import 'package:e_commerce_app/presentation/screens/product/widget/product_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          if (state is ProductDetailsLoading ||
              state is ProductDetailsInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductDetailsFailure) {
            return Center(child: Text(state.errorMessage));
          } else if (state is ProductDetailsSuccess) {
            final productModel = state.product;
            return ProductDetailsViewBody(productModel: productModel);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
