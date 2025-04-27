import 'package:bookly_app/core/helpers/snackBar.dart';
import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/features/auth/data/presentation/manger/auth_bloc/auth_bloc.dart';
import 'package:bookly_app/features/auth/data/presentation/views/RegisterationPage.dart';
import 'package:bookly_app/features/auth/data/presentation/views/widgets/CustomButtomWidget.dart';
import 'package:bookly_app/features/auth/data/presentation/views/widgets/TextFieldWidget.dart';
import 'package:bookly_app/features/auth/data/presentation/views/widgets/textWidget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

GlobalKey<FormState> formKey = GlobalKey();

class PassowrdResetView extends StatelessWidget {
  PassowrdResetView({super.key});
  static String id = 'PasswordReset';
  String? email;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is ResetLoading) {
          isLoading = false;
        } else if (state is ResetSuccess) {
          GoRouter.of(context).push(AppRouters.kLoginView);
          isLoading = false;
        } else if (state is ResetFailure) {
          showStatusMessage(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            body: Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 70),
                  Image.asset('assets/images/6195699.png', height: 150),
                  const SizedBox(height: 40),
                  Center(
                    child: TextWidget(
                      data: 'Password Reset',
                      textColor: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextWidget(
                      data:
                          'Enter Your Email Address associated with your account to reset Password',
                      textColor: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextFieldWidget(
                    onChanged: (data) {
                      email = data;
                    },
                    obsecureText: false,
                    labelText: 'Enter Your Email address..',
                    color: Colors.white,
                    iconColor: Colors.white,
                    suffixIcon: Icons.email,
                  ),
                  CustomButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(
                          context,
                        ).add(ResetEvent(email: email!));
                        GoRouter.of(context).push(AppRouters.kRegisterView);
                      }
                    },
                    displayText: 'Send Instructions',
                    backgroundColor: const Color(0xffCFF168),
                    textColor: Colors.black,
                    fontSize: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          GoRouter.of(context).push(AppRouters.kRegisterView);
                        },
                        child: const Text(
                          'Don\'t have Account ',
                          style: TextStyle(
                            color: Color(0xff83AC49),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xff83AC49),
                            decorationThickness: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
