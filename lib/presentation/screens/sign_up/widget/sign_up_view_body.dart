import 'package:e_commerce_app/core/constants/constant.dart';
import 'package:e_commerce_app/presentation/cubit/sign_up_cubit/signup_cubit.dart';
import 'package:e_commerce_app/presentation/widgets/custom_button.dart';
import 'package:e_commerce_app/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({
    super.key,
    required this._formKey,
    required this._firstNameController,
    required this._lastNameController,
    required this._emailController,
    required this._passwordController,
    required this.isLoading,
  });

  final GlobalKey<FormState> _formKey;
  final TextEditingController _firstNameController;
  final TextEditingController _lastNameController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final bool isLoading;

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: widget._formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Text(
                  'Create Account',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 6),
                Text(
                  'Sign up to start shopping',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                ),
                SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: widget._firstNameController,
                        text: 'Frist name',
                        validator: (value) => (value == null || value.isEmpty)
                            ? 'Required'
                            : null,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: CustomTextFormField(
                        text: 'Second name',
                        controller: widget._lastNameController,
                        validator: (value) => (value == null || value.isEmpty)
                            ? 'Required'
                            : null,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  controller: widget._emailController,
                  text: 'Email',
                  validator: (value) => (value == null || !value.contains('@'))
                      ? 'Please enter a valid email'
                      : null,
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  isPassword: true,
                  controller: widget._passwordController,
                  text: 'password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }

                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }

                    final hasUppercase = RegExp(r'[A-Z]').hasMatch(value);
                    final hasLowercase = RegExp(r'[a-z]').hasMatch(value);
                    final hasSpecial = RegExp(
                      r'[!@#$%^&*(),.?":{}|<>]',
                    ).hasMatch(value);

                    if (!hasUppercase) {
                      return 'Password must contain an uppercase letter';
                    }

                    if (!hasLowercase) {
                      return 'Password must contain a lowercase letter';
                    }

                    if (!hasSpecial) {
                      return 'Password must contain a special character';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    onPressed: widget.isLoading
                        ? null
                        : () {
                            if (widget._formKey.currentState!.validate()) {
                              context.read<SignupCubit>().signUp(
                                firstName: widget._firstNameController.text
                                    .trim(),
                                lastName: widget._lastNameController.text
                                    .trim(),
                                email: widget._emailController.text.trim(),
                                password: widget._passwordController.text,
                              );
                            }
                          },
                    text: 'Sign up',
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: TextButton(
                    onPressed: () => context.push('/sign_in_view'),
                    child: Text(
                      'Already have an account? Sign in',
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
