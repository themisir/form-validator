import '../form_validator.dart';

typedef StringValidationCallback = String Function(String value);
typedef ValidationBuilderCallback = void Function(ValidationBuilder builder);
typedef BoolCallback = bool Function(String value);
