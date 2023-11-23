import 'package:flutter/material.dart';
import 'package:flutter_assessment_task/shared/di.dart';

class DioErrorDialog extends StatelessWidget {
  final ErrorType errorType;
  final String title;
  final String message;

  const DioErrorDialog({
    super.key,
    required this.errorType,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final isServerError = errorType == ErrorType.serverError;
    return Dialog(
      elevation: 0,
      insetPadding: const EdgeInsets.all(24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 24),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isServerError ? const Color(0xffDC2626) : null,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('try ')),
            ],
          ),
        ),
      ),
    );
  }

  static void show({
    required BuildContext context,
    required ErrorType errorType,
    required String title,
    required String message,
  }) {
    showDialog(
      context: context,
      builder: (context) => DioErrorDialog(
        errorType: errorType,
        title: title,
        message: message,
      ),
    );
  }
}
