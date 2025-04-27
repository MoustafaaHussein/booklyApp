import 'package:bookly_app/features/home/data/presentation/manger/themes/theme_change_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      inactiveTrackColor: Colors.white,
      inactiveThumbColor: Colors.black,
      activeTrackColor: Colors.black,
      activeColor: Colors.white,
      value: isSwitched,
      onChanged: (value) {
        if (isSwitched == false) {
          BlocProvider.of<ThemeChangeCubit>(context).changeTheme();
          setState(() {
            isSwitched = value;
          });
        }
      },
    );
  }
}
