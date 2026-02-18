import 'package:budget_tracker/src/config/app_theme.dart';
import 'package:flutter/material.dart';

class AppSnackbar {
  AppSnackbar._();

  static final instance = AppSnackbar._();

  void show(
    BuildContext context, {
    required String message,
    SnackbarType type = SnackbarType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    // Hide any currently showing snackbar
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    // Show the new snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: _getBackgroundColor(type),
        duration: duration,
      ),
    );
  }

  void showSuccess(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    show(
      context,
      message: message,
      type: SnackbarType.success,
      duration: duration,
    );
  }

  void showError(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    show(
      context,
      message: message,
      type: SnackbarType.error,
      duration: duration,
    );
  }

  void showInfo(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    show(
      context,
      message: message,
      type: SnackbarType.info,
      duration: duration,
    );
  }

  Color _getBackgroundColor(SnackbarType type) {
    switch (type) {
      case SnackbarType.success:
        return AppTheme.successColor;
      case SnackbarType.error:
        return AppTheme.errorColor;
      case SnackbarType.info:
        return const Color(0xFF323232);
    }
  }
}

enum SnackbarType { success, error, info }
