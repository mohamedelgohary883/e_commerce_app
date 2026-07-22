import 'package:e_commerce_app/app/service_locator/injection_container.dart';
import 'package:e_commerce_app/presentation/cubit/verify_email_cubit/verify_email_cubit.dart';
import 'package:e_commerce_app/presentation/screens/verify_email/widget/verify_email_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key, required this.email});

  final String email;

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<VerifyEmailCubit>(),
      child: BlocConsumer<VerifyEmailCubit, VerifyEmailState>(
        listener: (context, state) {
          if (state is VerifyEmailFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          } else if (state is VerifyEmailSuccess) {
            context.go('/sign_in_view');
          } else if (state is ResendOtpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('OTP sent successfully')),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is VerifyEmailLoading;
          return VerifyEmail(
            formKey: _formKey,
            widget: widget,
            codeController: _codeController,
            isLoading: isLoading,
          );
        },
      ),
    );
  }
}
