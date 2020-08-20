import 'package:test/test.dart';
import 'package:form_validator/src/interfaces.dart';

void checkValidation(
  StringValidationCallback validate, {
  List<String> validValues,
  List<String> invalidValues,
}) {
  if (validValues != null) {
    validValues.forEach((value) {
      expect(validate(value), isNull, reason: '"$value" is valid value');
    });
  }

  if (invalidValues != null) {
    invalidValues.forEach((value) {
      expect(validate(value), isNotNull, reason: '"$value" is invalid value');
    });
  }
}
