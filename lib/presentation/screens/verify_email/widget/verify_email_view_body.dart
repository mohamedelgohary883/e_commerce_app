import 'package:e_commerce_app/presentation/cubit/verify_email_cubit/verify_email_cubit.dart';
import 'package:e_commerce_app/presentation/screens/verify_email/verify_email_view.dart';
import 'package:e_commerce_app/presentation/widgets/custom_button.dart';
import 'package:e_commerce_app/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({
    super.key,
    required this._formKey,
    required this.widget,
    required this._codeController,
    required this.isLoading,
  });

  final GlobalKey<FormState> _formKey;
  final VerifyEmailView widget;
  final TextEditingController _codeController;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify Email')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Check your inbox',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 8),
                Text(
                  'We sent a verification code to ${widget.email}',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                SizedBox(height: 32),
                CustomTextFormField(
                  keyboardType: TextInputType.number,
                  controller: _codeController,
                  text: 'Verification code',
                  validator: (value) => (value == null || value.isEmpty)
                      ? 'Please enter the code'
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
                              context.read<VerifyEmailCubit>().verifyEmail(
                                email: widget.email,
                                otp: _codeController.text.trim(),
                              );
                            }
                          },
                    text: 'verify',
                  ),
                ),
                const SizedBox(height: 16),

                Center(
                  child: TextButton(
                    onPressed: () {
                      context.read<VerifyEmailCubit>().resendOtp(
                        email: widget.email,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('OTP has been sent again'),
                        ),
                      );
                    },
                    child: const Text('Resend OTP'),
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
