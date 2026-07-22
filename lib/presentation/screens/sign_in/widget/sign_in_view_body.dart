import 'package:e_commerce_app/core/constants/constant.dart';
import 'package:e_commerce_app/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:e_commerce_app/presentation/widgets/custom_button.dart';
import 'package:e_commerce_app/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({
    super.key,
    required this._formKey,
    required this._emailController,
    required this._passwordController,
    required this.isLoading,
  });

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                const Text(
                  'Welcome Back',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 6),
                Text(
                  'Sign in to continue',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                ),
                const SizedBox(height: 32),
                CustomTextFormField(
                  controller: _emailController,
                  text: 'Email',
                  validator: (value) => (value == null || !value.contains('@'))
                      ? 'Please enter a valid email'
                      : null,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  isPassword: true,
                  controller: _passwordController,
                  text: 'password',
                  validator: (value) => (value == null || value.length < 6)
                      ? 'Password must be at least 6 characters'
                      : null,
                ),
                const SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              context.read<LoginCubit>().login(
                                email: _emailController.text.trim(),
                                password: _passwordController.text,
                              );
                            }
                          },
                    text: 'sign in',
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: TextButton(
                    onPressed: () => context.push('/'),
                    child: const Text(
                      "Don't have an account? Sign up",
                      style: TextStyle(color: kBlackColor, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
