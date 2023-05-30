import 'package:flutter/material.dart';

extension ValidationExtension on String? {
  bool isNotNullNotEmpty() {
    String value = this ?? '';
    return value.trim().isNotEmpty;
  }

  // Name Validator

  bool isValidName() {
    if (isNotNullNotEmpty()) {
      String value = this!;
      return value.codeUnits.every((element) =>
          element >= 65 && element <= 90 ||
          element >= 97 && element <= 122 ||
          value.codeUnits.any((element) => element == 32));
    } else {
      return false;
    }
  }

  // Email Validators

  bool isValidCharEmail() {
    String value = this!.trim();
    Pattern pattern = RegExp('^[a-zA-Z0-9.]+@gmail\.com\$');
    return value.contains(pattern);
  }

  bool isValidStructuredEmail() {
    String value = this!.trim();
    Pattern pattern = RegExp('^[^]+@gmail\.com\$');
    return value.contains(pattern);
  }

  // Password Validators

  bool isMinimumRequiredLength() {
    Pattern pattern = RegExp('^.{6,15}\$');
    if (this!.contains(pattern)) {
      return true;
    } else {
      return false;
    }
  }

  bool isContainsSpace() {
    return this!.codeUnits.any((element) => element == 32);
  }

  bool isSpecialCharacter() {
    return this!.codeUnits.any((element) =>
        element >= 33 && element <= 47 ||
        element >= 58 && element <= 64 ||
        element >= 91 && element <= 96 ||
        element >= 123 && element <= 126);
  }

  bool isAlphaNumericValue() {
    String value = this!.toLowerCase();

    return value.codeUnits.any((element) =>
        element >= 48 && element <= 57 && element >= 97 && element <= 122);
  }

  bool isNumericValue() {
    return this!.codeUnits.any((element) => element >= 48 && element <= 57);
  }

  bool isAlphabeticValue() {
    return this!.codeUnits.any((element) =>
        element >= 65 && element <= 90 || element >= 97 && element <= 122);
  }
}
