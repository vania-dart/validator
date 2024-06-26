import 'package:dart_validator/dart_validator.dart';

class CustomValidator extends FormValidator {
  final RegExp customRegex;
  final String errorMessage;
  CustomValidator(this.customRegex,
      {super.nextValidator, this.errorMessage = "Custom Error"});
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    if (!customRegex.hasMatch(value)) {
      return errorMessage;
    }
    return nextValidator?.validate(value);
  }
}
