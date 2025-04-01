import 'package:bookly_app/features/auth/data/presentation/views/widgets/TextFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:password_strength_checker/password_strength_checker.dart';

class CustomPassowrdChecker extends StatelessWidget {
  CustomPassowrdChecker({
    super.key,
    required this.email,
    required this.password,
  });
  final passNotifier = ValueNotifier<PasswordStrength?>(null);
  final String email, password;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldWidget(
          onChanged: (data) {
            passNotifier.value = PasswordStrength.calculate(text: data);
            password != data;
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
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: PasswordStrengthChecker(strength: passNotifier),
          ),
        ),
        TextFieldWidget(
          onChanged: (data) {
            passNotifier.value = PasswordStrength.calculate(text: data);
          },
          obsecureText: true,
          labelText: 'Confirm Password',
          hintText: 'Confirm Password',
          color: Colors.white,
          iconColor: Colors.white,
          suffixIcon: Icons.lock,
        ),
      ],
    );
  }
}
