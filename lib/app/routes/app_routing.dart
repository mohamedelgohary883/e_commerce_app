import 'package:e_commerce_app/app/service_locator/injection_container.dart';
import 'package:e_commerce_app/presentation/cubit/product_deatils_cubit/product_details_cubit.dart';
import 'package:e_commerce_app/presentation/screens/home/home_view.dart';
import 'package:e_commerce_app/presentation/screens/product/product_details_view.dart';
import 'package:e_commerce_app/presentation/screens/sign_in/sign_in_view.dart';
import 'package:e_commerce_app/presentation/screens/sign_up/sign_up_view.dart';
import 'package:e_commerce_app/presentation/screens/verify_email/verify_email_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const SignUpView();
        },
      ),
      GoRoute(
        path: '/sign_in_view',
        builder: (context, state) {
          return const SignInView();
        },
      ),
      GoRoute(
        path: '/verify_email_view',
        builder: (context, state) {
          final email = state.extra as String? ?? '';
          return VerifyEmailView(email: email);
        },
      ),
      GoRoute(
        path: '/home_view',
        builder: (context, state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: '/product_details_view/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return BlocProvider<ProductDetailsCubit>(
            create: (context) =>
                getIt<ProductDetailsCubit>()..getProductDetails(id),
            child: const ProductDetailsView(),
          );
        },
      ),
    ],
  );
}
