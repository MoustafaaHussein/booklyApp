import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ToLoginPage extends StatelessWidget {
  const ToLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        GoRouter.of(context).push(AppRouters.kLoginView);
      },
      child: const Text(
        'Already Have an Account ?',
        style: TextStyle(
          color: Color(0xffCFF168),
          fontSize: 16,
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.underline,
          decorationColor: Color(0xffCFF168),
          decorationThickness: 1.5,
        ),
      ),
    );
  }
}
