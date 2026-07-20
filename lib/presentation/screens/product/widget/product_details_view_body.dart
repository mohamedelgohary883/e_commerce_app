import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/constants/constant.dart';
import 'package:e_commerce_app/core/theme/styles.dart';
import 'package:e_commerce_app/infrastructure/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDeatailsViewBody extends StatelessWidget {
  const ProductDeatailsViewBody({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              width: double.infinity,
              height: 280,
              fit: BoxFit.cover,
              imageUrl: productModel.coverPictureUrl ?? '',
              errorWidget: (context, url, error) {
                return Icon(Icons.error, size: 60);
              },
              placeholder: (context, url) {
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
          SizedBox(height: 20),
          Text(productModel.name ?? '', style: Styles.textStyel32(context)),
          SizedBox(height: 8),
          Text(
            '${productModel.price?.toStringAsFixed(2) ?? '0.00'} \$',
            style: Styles.textStyel23(
              context,
            ).copyWith(color: kBlackColor, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            'PDC: ${productModel.productCode ?? ''}',
            style: Styles.textStyel19(context).copyWith(color: Colors.grey),
          ),
          SizedBox(height: 20),
          Text('Description', style: Styles.textStyel21(context)),
          SizedBox(height: 8),
          Text(
            productModel.description ?? 'No description available.',
            style: Styles.textStyel19(context),
          ),
          SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text('Add to Cart', style: Styles.textStyel21(context)),
            ),
          ),
        ],
      ),
    );
  }
}
