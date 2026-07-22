import 'package:e_commerce_app/app/service_locator/injection_container.dart';
import 'package:e_commerce_app/presentation/cubit/product_cubit/product_cubit.dart';
import 'package:e_commerce_app/presentation/screens/home/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductCubit>(),
      child: const HomeViewBody(),
    );
  }
}
