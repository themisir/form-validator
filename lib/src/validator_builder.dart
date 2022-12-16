import 'i18n/all.dart';
import 'locale.dart';

typedef StringValidationCallback = String? Function(String? value);

// C# Action<T>
typedef Action<T> = Function(T builder);

class ValidationBuilder {
  ValidationBuilder({
    String? localeName,
    this.optional = false,
    FormValidatorLocale? locale,
    this.requiredMessage,
  }) : _locale = locale ??
            (localeName == null ? globalLocale : createLocale(localeName)) {
    ArgumentError.checkNotNull(_locale, 'locale');
    // Unless a builder is optional, the first thing we do is to add a
    // [required] validator. All subsequent validators should expect
    // a non-null argument.
    if (!optional) required(requiredMessage);
  }

  static FormValidatorLocale globalLocale = createLocale('default');
  static void setLocale(String localeName) {
    globalLocale = createLocale(localeName);
  }

  static final RegExp _emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9\-\_]+(\.[a-zA-Z]+)*$");
  static final RegExp _nonDigitsExp = RegExp(r'[^\d]');
  static final RegExp _anyLetter = RegExp(r'[A-Za-z]');
  static final RegExp _phoneRegExp = RegExp(r'^\d{7,15}$');
  static final RegExp _ipv4RegExp = RegExp(
      r'^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$');
  static final RegExp _ipv6RegExp = RegExp(
      r'^(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))$');
  static final RegExp _urlRegExp = RegExp(
      r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)');

  final bool optional;
  final String? requiredMessage;
  final FormValidatorLocale _locale;
  final List<StringValidationCallback> validations = [];

  /// Clears validation list and adds required validation if
  /// [optional] is false
  ValidationBuilder reset() {
    validations.clear();
    if (optional != true) {
      required(requiredMessage);
    }
    return this;
  }

  /// Adds new item to [validations] list, returns this instance
  ValidationBuilder add(StringValidationCallback validator) {
    validations.add(validator);
    return this;
  }

  /// Tests [value] against defined [validations]
  String? test(String? value) {
    for (var validate in validations) {
      // Return null if field is optional and value is null
      if (optional && (value == null || value.isEmpty)) {
        return null;
      }

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
  /// right builder's error. Because this is default behaviour on most of the
  /// programming languages.
  ValidationBuilder or(
    Action<ValidationBuilder> left,
    Action<ValidationBuilder> right, {
    bool reverse = false,
  }) {
    // Create
    final v1 = ValidationBuilder(locale: _locale);
    final v2 = ValidationBuilder(locale: _locale);

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
  ValidationBuilder required([String? message]) =>
      add((v) => v == null || v.isEmpty ? message ?? _locale.required() : null);

  /// Value length must be greater than or equal to [minLength]
  ValidationBuilder minLength(int minLength, [String? message]) =>
      add((v) => v!.length < minLength
          ? message ?? _locale.minLength(v, minLength)
          : null);

  /// Value length must be less than or equal to [maxLength]
  ValidationBuilder maxLength(int maxLength, [String? message]) =>
      add((v) => v!.length > maxLength
          ? message ?? _locale.maxLength(v, maxLength)
          : null);

  /// Value must match [regExp]
  ValidationBuilder regExp(RegExp regExp, String message) =>
      add((v) => regExp.hasMatch(v!) ? null : message);

  /// Value must be a well formatted email
  ValidationBuilder email([String? message]) => add(
      (v) => _emailRegExp.hasMatch(v!) ? null : message ?? _locale.email(v));

  /// Value must be a well formatted phone number
  ValidationBuilder phone([String? message]) =>
      add((v) => !_anyLetter.hasMatch(v!) &&
              _phoneRegExp.hasMatch(v.replaceAll(_nonDigitsExp, ''))
          ? null
          : message ?? _locale.phoneNumber(v));

  /// Value must be a well formatted IPv4 address
  ValidationBuilder ip([String? message]) =>
      add((v) => _ipv4RegExp.hasMatch(v!) ? null : message ?? _locale.ip(v));

  /// Value must be a well formatted IPv6 address
  ValidationBuilder ipv6([String? message]) =>
      add((v) => _ipv6RegExp.hasMatch(v!) ? null : message ?? _locale.ipv6(v));

  /// Value must be a well formatted URL address
  ValidationBuilder url([String? message]) =>
      add((v) => _urlRegExp.hasMatch(v!) ? null : message ?? _locale.url(v));
}
