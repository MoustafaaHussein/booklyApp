// ignore_for_file: file_names, use_build_context_synchronously, must_be_immutable

import 'package:bookly_app/core/helpers/snackBar.dart';
import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/features/auth/data/presentation/manger/auth_bloc/auth_bloc.dart';
import 'package:bookly_app/features/auth/data/presentation/views/widgets/CustomButtomWidget.dart';
import 'package:bookly_app/features/auth/data/presentation/views/widgets/TextFieldWidget.dart';
import 'package:bookly_app/features/auth/data/presentation/views/widgets/textWidget.dart';
import 'package:bookly_app/features/auth/data/presentation/views/widgets/to_registeration_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:password_strength_checker/password_strength_checker.dart';

FirebaseAuth auth = FirebaseAuth.instance;
bool isLoading = false;

class RegisterView extends StatelessWidget {
  String? email;

  String? password;

  static String id = 'RegisterationPage';
  GlobalKey<FormState> registerFormKey = GlobalKey();

  RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    final passNotifier = ValueNotifier<PasswordStrength?>(null);
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterFailed) {
          isLoading = false;
          showStatusMessage(context, state.errorMessage);
        } else if (state is RegisterSuccessfully) {
          showStatusMessage(context, 'Account created successfully ');
          GoRouter.of(context).push(AppRouters.kLoginView);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            body: Form(
              key: registerFormKey,
              child: ListView(
                children: [
                  SizedBox(
                    width: double.infinity,

                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          data: 'Scholar chat',
                          textColor: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Pacifico',
                        ),
                        const SizedBox(height: 20),
                        TextWidget(
                          data: 'Sign Up',
                          textColor: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Pacifico',
                          fontWeight: FontWeight.normal,
                        ),
                        const SizedBox(height: 30),
                        TextFieldWidget(
                          obsecureText: false,
                          onChanged: (data) {
                            email = data;
                          },
                          labelText: 'Email',
                          hintText: 'Email',
                          color: Colors.white,
                          iconColor: Colors.white,
                          suffixIcon: Icons.email,
                        ),
                        TextFieldWidget(
                          onChanged: (data) {
                            passNotifier.value = PasswordStrength.calculate(
                              text: data,
                            );
                            password = data;
                          },
                          obsecureText: true,
                          labelText: 'Password',
                          hintText: 'Password',
                          color: Colors.white,
                          iconColor: Colors.white,
                          suffixIcon: Icons.lock,
                        ),
                        /* const SizedBox(height: 20), */
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: PasswordStrengthChecker(
                              strength: passNotifier,
                            ),
                          ),
                        ),
                        TextFieldWidget(
                          onChanged: (data) {
                            passNotifier.value = PasswordStrength.calculate(
                              text: data,
                            );
                          },
                          obsecureText: true,
                          labelText: 'Confirm Password',
                          hintText: 'Confirm Password',
                          color: Colors.white,
                          iconColor: Colors.white,
                          suffixIcon: Icons.lock,
                        ),
                        CustomButton(
                          onTap: () async {
                            if (registerFormKey.currentState!.validate()) {
                              BlocProvider.of<AuthBloc>(context).add(
                                RegisterEvent(
                                  email: email!,
                                  password: password!,
                                ),
                              );
                            }
                          },
                          displayText: 'Register',
                          backgroundColor: const Color(0xffCFF168),
                          textColor: Colors.black,
                          fontSize: 30,
                        ),
                        const ToLoginPage(),
                      ],
                    ),
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
