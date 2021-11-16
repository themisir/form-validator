import 'package:form_validator/form_validator.dart';
import 'package:test/test.dart';

void checkValidation(
  StringValidationCallback validate, {
  List<String?> validValues = const [],
  List<String?> invalidValues = const [],
}) {
  if (validValues.isNotEmpty) {
    validValues.forEach((value) {
      expect(validate(value), isNull, reason: '"$value" is valid value');
    });
  }

  if (invalidValues.isNotEmpty) {
    invalidValues.forEach((value) {
      expect(validate(value), isNotNull, reason: '"$value" is invalid value');
    });
  }
}
