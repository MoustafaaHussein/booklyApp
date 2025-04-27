// ignore_for_file: use_build_context_synchronously

import 'package:bookly_app/core/helpers/snackBar.dart';
import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/features/auth/data/presentation/manger/auth_bloc/auth_bloc.dart';
import 'package:bookly_app/features/auth/data/presentation/views/widgets/CustomButtomWidget.dart';
import 'package:bookly_app/features/auth/data/presentation/views/widgets/TextFieldWidget.dart';
import 'package:bookly_app/features/auth/data/presentation/views/widgets/textWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

FirebaseAuth auth = FirebaseAuth.instance;
bool isLoading = false;

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  String? email;

  String? passowrd;

  LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginFailure) {
          showStatusMessage(context, state.errorMessage);
        } else if (state is LoginSuccess) {}
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          body: Form(
            key: formKey,
            child: SizedBox(
              width: double.infinity,

              child: ListView(
                children: [
                  const SizedBox(height: 70),
                  const SizedBox(height: 40),
                  Center(
                    child: TextWidget(
                      data: 'Sign in',
                      textColor: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Pacifico',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextFieldWidget(
                    onChanged: (data) {
                      email = data;
                    },
                    obsecureText: false,
                    labelText: 'Email or Username',
                    hintText: 'Email',
                    color: Colors.white,
                    iconColor: Colors.white,
                    suffixIcon: Icons.email,
                  ),
                  TextFieldWidget(
                    onChanged: (data) {
                      passowrd = data;
                    },
                    obsecureText: true,
                    labelText: ' Password',
                    color: Colors.white,
                    iconColor: Colors.white70,
                    suffixIcon: Icons.lock,
                  ),
                  CustomButton(
                    onTap: () {
                      if (formKey.currentState!.validate() &&
                          email != null &&
                          passowrd != null) {
                        BlocProvider.of<AuthBloc>(
                          context,
                        ).add(LoginEvent(email: email!, password: passowrd!));
                        GoRoute(path: AppRouters.kHomePath);
                      } else {
                        showStatusMessage(
                          context,
                          "Please enter both email and password.",
                        );
                      }
                    },
                    backgroundColor: const Color(0xffCFF168),
                    displayText: 'Login',
                    textColor: Colors.black,
                    fontSize: 25,
                  ),
                  CustomButton(
                    onTap: () {
                      GoRouter.of(context).push(AppRouters.kRegisterView);
                    },
                    backgroundColor: Colors.white,
                    borderColor: const Color.fromARGB(255, 70, 146, 71),
                    displayText: 'Create An Account',
                    textColor: const Color.fromARGB(255, 70, 146, 71),
                    fontSize: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Can\'t remember password ?',
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
        ),
      ),
    );
  }
}
