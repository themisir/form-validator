import '../locale.dart';

class LocaleEn implements FormValidatorLocale {
  const LocaleEn();

  @override
  String name() => 'en';

  @override
  String minLength(String v, int n) =>
      'The field must be at least $n characters long';

  @override
  String maxLength(String v, int n) =>
      'The field must be at most $n characters long';

  @override
  String email(String v) => 'The field is not a valid email address';

  @override
  String phoneNumber(String v) => 'The field is not a valid phone number';

  @override
  String required() => 'The field is required';

  @override
  String ip(String v) => 'The field is not a valid IP address';

  @override
  String ipv6(String v) => 'The field is not a valid IPv6 address';

  @override
  String url(String v) => 'The field is not a valid URL address';
}
