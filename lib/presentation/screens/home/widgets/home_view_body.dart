import 'package:e_commerce_app/core/theme/styles.dart';
import 'package:e_commerce_app/presentation/cubit/product_cubit/product_cubit.dart';
import 'package:e_commerce_app/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products', style: Styles.textStyel23(context)),
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductSuccess) {
            return ListView.builder(
              padding: EdgeInsets.only(top: 10),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return ProductItem(productModel: state.products[index]);
              },
            );
          } else if (state is ProductFailure) {
            return Center(child: Text(state.errorMessage));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
