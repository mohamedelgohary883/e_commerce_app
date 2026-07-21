import 'package:cached_network_image/cached_network_image.dart';
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
            borderRadius: BorderRadius.circular(14),
            child: CachedNetworkImage(
              width: double.infinity,
              height: 260,
              fit: BoxFit.cover,
              imageUrl: productModel.coverPictureUrl ?? '',
              errorWidget: (context, url, error) => Container(
                color: Colors.grey.shade200,
                child: const Icon(Icons.image_not_supported_outlined),
              ),
            ),
          ),
          SizedBox(height: 18),
          Text(
            productModel.name ?? '',
            style: Styles.textStyel21(
              context,
            ).copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 6),
          Text(
            '${productModel.price?.toStringAsFixed(2) ?? '0.00'} \$',
            style: Styles.textStyel21(
              context,
            ).copyWith(color: Colors.teal, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 4),
          Text(
            'PDC ${productModel.productCode ?? ''}',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
          ),
          SizedBox(height: 20),
          Text(
            'Description',
            style: Styles.textStyel19(
              context,
            ).copyWith(fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 8),
          Text(
            productModel.description?.isNotEmpty == true
                ? productModel.description!
                : 'No description available.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Add to Cart', style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }
}
