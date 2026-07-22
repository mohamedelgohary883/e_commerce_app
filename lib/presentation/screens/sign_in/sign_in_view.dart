import 'package:e_commerce_app/app/service_locator/injection_container.dart';
import 'package:e_commerce_app/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:e_commerce_app/presentation/screens/sign_in/widget/sign_in_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          } else if (state is LoginSuccess) {
            context.go('/home_view');
          }
        },
        builder: (context, state) {
          final isLoading = state is LoginLoading;
          return SignInViewBody(
            formKey: _formKey,
            emailController: _emailController,
            passwordController: _passwordController,
            isLoading: isLoading,
          );
        },
      ),
    );
  }
}
