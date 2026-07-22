import 'package:e_commerce_app/app/service_locator/injection_container.dart';
import 'package:e_commerce_app/presentation/cubit/sign_up_cubit/signup_cubit.dart';
import 'package:e_commerce_app/presentation/screens/sign_up/widget/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignupCubit>(),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('signup failed')));
          } else if (state is SignupSuccess) {
            context.push(
              '/verify_email_view',
              extra: _emailController.text.trim(),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is SignupLoading;
          return SignUpViewBody(
            formKey: _formKey,
            firstNameController: _firstNameController,
            lastNameController: _lastNameController,
            emailController: _emailController,
            passwordController: _passwordController,
            isLoading: isLoading,
          );
        },
      ),
    );
  }
}
