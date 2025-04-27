// ignore_for_file: file_names

import 'package:flutter/material.dart';

void showStatusMessage(BuildContext context, String statusMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 5),
      content: Center(
        child: Text(
          statusMessage,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    ),
  );
}
