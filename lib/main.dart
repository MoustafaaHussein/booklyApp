import 'package:bookly_app/constants.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(
  DevicePreview(
    enabled: true,
    builder: (context) => const BooklyApp(), // Wrap your app
  ),
);

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor),
      /* darkTheme: ThemeData.dark(), */
      home: const SplashView(),
    );
  }
}
