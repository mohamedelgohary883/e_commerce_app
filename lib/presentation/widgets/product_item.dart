import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/theme/styles.dart';
import 'package:e_commerce_app/infrastructure/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 12),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  width: 120,
                  fit: BoxFit.cover,
                  imageUrl: productModel.coverPictureUrl ?? '',
                  errorWidget: (context, url, error) {
                    return const Icon(Icons.error);
                  },
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      productModel.name ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyel23(
                        context,
                      ).copyWith(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      productModel.description ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyel19(
                        context,
                      ).copyWith(color: Colors.grey.shade700),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'PDC: ${productModel.productCode ?? ''}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyel19(context).copyWith(fontSize: 14),
                    ),

                    Text(
                      '${productModel.price?.toStringAsFixed(2) ?? '0.00'} \$',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyel19(
                        context,
                      ).copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
