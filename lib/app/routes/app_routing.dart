import 'package:e_commerce_app/infrastructure/models/product_model.dart';
import 'package:e_commerce_app/presentation/screens/home/home_view.dart';
import 'package:e_commerce_app/presentation/screens/product/product_details_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: '/product_details_view',
        builder: (context, state) {
          final product = state.extra as ProductModel;
          return ProductDetailsView(productModel: product);
        },
      ),
    ],
  );
}
