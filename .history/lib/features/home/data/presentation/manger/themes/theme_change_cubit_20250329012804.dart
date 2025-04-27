import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_change_state.dart';

class ThemeChangeCubit extends Cubit<ThemeChangeState> {
  ThemeChangeCubit() : super(const ThemeChangeInitial()) {
    loadTheme();
  }
  void changeTheme() {
    if (state is LightTheme) {
      emit(const DarkTheme());
      _saveTheme(true);
    } else {
      emit(const LightTheme());
      _saveTheme(false);
    }
  }

  // Save theme preference in SharedPreferences
  Future<void> _saveTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', isDark);
  }

  // Load theme preference
  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDark') ?? false;
    emit(isDark ? const DarkTheme() : const LightTheme());
  }
}
