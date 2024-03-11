// form_utils.dart

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/form_controller.dart';

class FormUtils {
  static Future<void> selectDates(
      BuildContext context, RxString controller) async {
    DateTime currentDate = DateTime.now();
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != currentDate) {
      controller.value = formatDate(picked);
      if (kDebugMode) {
        print("Date selected: ${controller.value}");
      }
    } else {
      if (kDebugMode) {
        print("Date selection canceled");
      }
    }
  }

  static String formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  static bool isValidForm(VTLetterFormController controller) {
    if (controller.fromController.value.isEmpty ||
        controller.toController.value.isEmpty ||
        controller.subjectsController.value.isEmpty) {
      controller.reasonError.value =
          controller.subjectsController.value.isEmpty;
      controller.toError.value = controller.toController.value.isEmpty;
      controller.fromError.value = controller.fromController.value.isEmpty;

      if (kDebugMode) {
        print("Form validation failed");
      }
      return false;
    }
    if (kDebugMode) {
      print("Form validation successful");
    }
    return true;
  }

  static String calculateDays(String fromDate, String toDate) {
    try {
      DateTime from = DateTime.parse(fromDate);
      DateTime to = DateTime.parse(toDate);
      Duration duration = to.difference(from);
      return duration.inDays.toString();
    } catch (e) {
      if (kDebugMode) {
        print("Error parsing dates: $e");
      }
      return 'Invalid date format';
    }
  }

  static Future<void> submitForm(
      BuildContext context, VTLetterFormController controller) async {
    if (isValidForm(controller)) {
      // Perform form submission logic here
      if (kDebugMode) {
        print("Form submitted successfully");
      }
    } else {
      if (kDebugMode) {
        print("Form submission failed");
      }
    }
  }
}
