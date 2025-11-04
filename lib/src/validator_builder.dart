import 'i18n/all.dart';
import 'locale.dart';
import 'validator_options.dart';

typedef StringValidationCallback = String? Function(String? value);

// C# Action<T>
typedef Action<T> = Function(T builder);

class ValidationBuilder {
  ValidationBuilder({
    this.optional = false,
    this.requiredMessage,
    ValidatorOptions? options,
    String? localeName,
    FormValidatorLocale? locale,
  })  : _locale = locale ??
            (localeName == null ? globalLocale : createLocale(localeName)),
        _options = options ?? globalOptions {
    ArgumentError.checkNotNull(_locale, 'locale');
    // Unless a builder is optional, the first thing we do is to add a
    // [required] validator. All subsequent validators should expect
    // a non-null argument.
    if (!optional) required(requiredMessage);
  }

  static ValidatorOptions globalOptions = ValidatorOptions();

  static FormValidatorLocale globalLocale = createLocale('default');
  static void setLocale(String localeName) {
    globalLocale = createLocale(localeName);
  }

  final bool optional;
  final String? requiredMessage;
  final FormValidatorLocale _locale;
  final List<StringValidationCallback> validations = [];
  final ValidatorOptions _options;

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

  /// Checks if two values match
  ValidationBuilder match(String? otherValue, [String? message]) =>
      add((v) => v == otherValue ? null : message ?? _locale.noMatch());

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
  ValidationBuilder email([String? message]) =>
      add((v) => (_options.emailRegExp != null
              ? _options.emailRegExp!.hasMatch(v!)
              : _checkEmail(v!))
          ? null
          : message ?? _locale.email(v));

  static final RegExp _emailLocalSpecialChars = RegExp(r'["(),:;<>@\[\\\]]');

  static bool _checkEmail(String s) {
    // The goal is to allow as much values as possible while eliminating obvious
    // invalid values. False negatives are way more harmful than false positives
    // for client side email validation.
    //
    // A proper server-side SMTP based validation should be used on top whenever
    // the validity of the email address is a concern.

    /*
      Ref 1: https://stackoverflow.com/a/48170419
      Ref 2: https://cheatsheetseries.owasp.org/cheatsheets/Input_Validation_Cheat_Sheet.html#syntactic-validation

      1. The email address contains two parts, separated with an @ symbol.
      2. The email address does not contain dangerous characters (such as backticks, single or double quotes, or null bytes).
         Exactly which characters are dangerous will depend on how the address is going to be used (echoed in page, inserted into database, etc).
      3. The domain part contains only letters, numbers, hyphens (-) and periods (.).
      4. The email address is a reasonable length:
        4.1. The local part (before the @) should be no more than 63 characters.
        4.2. The total length should be no more than 254 characters.
    */

    // 2. "dangerous characters" is backend dependent, thus we can't implement one fits all solution

    // 4.2.
    if (s.length > 254 || s.length < 3) return false;

    // 1.
    final atIndex = s.lastIndexOf('@');
    if (atIndex < 0) return false;

    // 4.
    final local = s.substring(0, atIndex);
    if (local.length > 63 || local.length == 0) return false;

    final localIsQuoted =
        local.startsWith('"') && local.endsWith('"') && local.length > 2;
    if (!localIsQuoted) {
      /*
         Ref 3: https://en.wikipedia.org/wiki/Email_address#:~:text=Space%20and%20special%20characters

         Space and special characters "(),:;<>@[\] are allowed with
         restrictions (they are only allowed inside a quoted string,
         as described in the paragraph below, and in that quoted string,
         any backslash or double-quote must be preceded once by a backslash);
      */
      if (_emailLocalSpecialChars.hasMatch(local)) return false;
    }

    // 3.
    final domain = s.substring(atIndex + 1);
    if (!domain.contains('.')) return false;

    // Not practical, but syntactically correct
    if (domain.length < 3) return false;

    /*
       Ref 4: https://webmasters.stackexchange.com/a/119105

       > Each node has a label, which is zero to 63 octets in length. [...]
       > One label is reserved, and that is the null (i.e., zero length) label used for the root.
       >
       > RFC 1034
    */
    if (domain.startsWith('.')) return false;
    if (domain.contains('..')) return false;

    return true;
  }

  // needed for short circuiting the full validation
  static final RegExp _anyLetter = RegExp(r'[A-Za-z]');
  static final RegExp _nonDigitsExp = RegExp(r'[^\d]');

  /// Value must be a well formatted phone number
  ValidationBuilder phone([String? message]) =>
      add((v) => !_anyLetter.hasMatch(v!) &&
              _options.phoneRegExp.hasMatch(v.replaceAll(_nonDigitsExp, ''))
          ? null
          : message ?? _locale.phoneNumber(v));

  /// Value must be a well formatted IPv4 address
  ValidationBuilder ip([String? message]) => add((v) =>
      _options.ipv4RegExp.hasMatch(v!) ? null : message ?? _locale.ip(v));

  /// Value must be a well formatted IPv6 address
  ValidationBuilder ipv6([String? message]) => add((v) =>
      _options.ipv6RegExp.hasMatch(v!) ? null : message ?? _locale.ipv6(v));

  /// Value must be a well formatted URL address
  ValidationBuilder url([String? message]) => add((v) =>
      _options.urlRegExp.hasMatch(v!) ? null : message ?? _locale.url(v));
}
