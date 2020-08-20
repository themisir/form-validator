import 'expressions.dart';
import 'form_validator.dart';
import 'localization.dart';
import 'interfaces.dart';

class ValidationBuilder {
  ValidationBuilder({
    String localeName,
    LocaleData locale,
    this.optional,
    String requiredMessage,
  })  : _messages = locale ??
            (localeName == null
                ? FormValidator.locale
                : FormValidator.getLocale(localeName)),
        _requiredMessage = requiredMessage {
    ArgumentError.checkNotNull(_messages, 'locale');
    reset();
  }

  /// Change global locale
  static void setLocale(String localeName) {
    FormValidator.setLocale(localeName);
  }

  final LocaleData _messages;
  final String _requiredMessage;

  /// Validations that applied
  final validations = <StringValidationCallback>[];

  /// Whether the field value could be null or empty
  final bool optional;

  /// Message translation data
  LocaleData get messages => _messages;

  /// Clears validation list and adds required validation if
  /// [optional] is false
  ValidationBuilder reset() {
    validations.clear();
    return optional ? this : required(_requiredMessage);
  }

  /// Adds new item to [validations] list, returns this instance
  ValidationBuilder add(StringValidationCallback validator) {
    validations.add(validator);
    return this;
  }

  /// Adds a value that checks if [condition] resolves true, if not returns
  /// [message].
  ValidationBuilder condition(BoolCallback condition, String message) =>
      add((value) => condition(value) ? null : message);

  /// Tests [value] against defined [validations]
  String test(String value) {
    for (var validate in validations) {
      // Otherwise execute validations
      final result = validate(value);
      if (result != null) {
        return result;
      }
    }
    return null;
  }

  /// Returns a validator function for FormInput
  StringValidationCallback build() => test;

  /// Throws error only if [left] and [right] validators throw error same time.
  /// If [reverse] is true left builder's error will be displayed otherwise
  /// right builder's error. Because this is default behaviour on most
  /// programming languages.
  ValidationBuilder or(
    ValidationBuilderCallback left,
    ValidationBuilderCallback right, {
    bool reverse = false,
  }) {
    // Create
    final v1 = ValidationBuilder(locale: _messages);
    final v2 = ValidationBuilder(locale: _messages);

    // Configure
    left(v1);
    right(v2);

    // Build
    final v1cb = v1.build();
    final v2cb = v2.build();

    // Test
    return add((value) {
      final leftResult = v1cb(value);
      if (leftResult == null) {
        return null;
      }
      final rightResult = v2cb(value);
      if (rightResult == null) {
        return null;
      }
      return reverse == true ? leftResult : rightResult;
    });
  }

  /// Value must not be null
  ValidationBuilder required([String message]) => condition(
      (value) => value != null && value.isNotEmpty,
      message ?? _messages.get('required'));

  /// Value length must be greater than or equal to [minLength]
  ValidationBuilder minLength(int minLength, [String message]) => condition(
      (value) => value.length >= minLength,
      message ?? _messages.get('minLength', {'min': minLength}));

  /// Value length must be less than or equal to [maxLength]
  ValidationBuilder maxLength(int maxLength, [String message]) => condition(
      (value) => value.length <= maxLength,
      message ?? _messages.get('maxLength', {'max': maxLength}));

  /// Value must match [regExp]
  ValidationBuilder regExp(RegExp regExp, String message) =>
      condition((value) => regExp.hasMatch(value), message);

  /// Value must be a well formatted email
  ValidationBuilder email([String message]) => condition(
      (value) => emailRegExp.hasMatch(value),
      message ?? _messages.get('email'));

  /// Value must be a well formatted phone number
  ValidationBuilder phone([String message]) => condition(
      (value) =>
          !anyLetter.hasMatch(value) &&
          phoneRegExp.hasMatch(value.replaceAll(nonDigitsExp, '')),
      message ?? _messages.get('phoneNumber'));

  /// Value must be a well formatted IPv4 address
  ValidationBuilder ip([String message]) => condition(
      (value) => ipv4RegExp.hasMatch(value), message ?? _messages.get('ip'));

  /// Value must be a well formatted IPv6 address
  ValidationBuilder ipv6([String message]) => condition(
      (value) => ipv6RegExp.hasMatch(value), message ?? _messages.get('ipV6'));

  /// Value must be a well formatted IPv6 address
  ValidationBuilder url([String message]) => condition(
      (value) => urlRegExp.hasMatch(value), message ?? _messages.get('url'));
}
