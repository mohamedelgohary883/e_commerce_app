import 'package:e_commerce_app/core/network/api_service.dart';
import 'package:e_commerce_app/infrastructure/repos/home_repo.dart';
import 'package:e_commerce_app/presentation/cubit/product_cubit/product_cubit.dart';
import 'package:e_commerce_app/presentation/screens/home/widgets/home_view_body.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(ProductRepo(ApiService(Dio()))),
      child: const HomeViewBody(),
    );
  }
}
