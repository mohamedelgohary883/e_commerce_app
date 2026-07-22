import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/network/api_service.dart';
import 'package:e_commerce_app/infrastructure/datasources/auth_data_source.dart';
import 'package:e_commerce_app/infrastructure/datasources/product_data_source.dart';
import 'package:e_commerce_app/infrastructure/repos/auth_repo.dart';
import 'package:e_commerce_app/infrastructure/repos/product_repo.dart';
import 'package:e_commerce_app/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:e_commerce_app/presentation/cubit/product_cubit/product_cubit.dart';
import 'package:e_commerce_app/presentation/cubit/product_deatils_cubit/product_details_cubit.dart';
import 'package:e_commerce_app/presentation/cubit/sign_up_cubit/signup_cubit.dart';
import 'package:e_commerce_app/presentation/cubit/verify_email_cubit/verify_email_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiService>(ApiService(getIt()));

  getIt.registerSingleton<ProductDataSource>(ProductDataSourceImpl(getIt()));
  getIt.registerSingleton<ProductRepo>(ProductRepo(getIt()));
  getIt.registerFactory<ProductCubit>(() => ProductCubit(getIt()));
  getIt.registerFactory<ProductDetailsCubit>(
    () => ProductDetailsCubit(getIt()),
  );

  getIt.registerSingleton<AuthDataSource>(AuthDataSourceImpl(getIt()));
  getIt.registerSingleton<AuthRepo>(AuthRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
  getIt.registerFactory<VerifyEmailCubit>(() => VerifyEmailCubit(getIt()));
}
