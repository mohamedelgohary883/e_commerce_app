import 'package:e_commerce_app/core/theme/styles.dart';
import 'package:e_commerce_app/infrastructure/models/product_model.dart';
import 'package:e_commerce_app/presentation/screens/product/widget/product_details_view_body.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          productModel.name ?? 'Product Details',
          style: Styles.textStyel23(context),
        ),
      ),
      body: ProductDeatailsViewBody(productModel: productModel),
    );
  }
}
