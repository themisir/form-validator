import '../form_validator_locale.dart';

// TODO: Improve validation messages

class LocaleEn extends FormValidatorLocale {
  @override
  String name() => 'en';

  @override
  String minLength(String v, int n) =>
      'Minimum length must be at least $n characters';

  @override
  String maxLength(String v, int n) => '...';

  @override
  String email(String v) => 'Email is wrong';

  @override
  String phoneNumber(String v) => 'Phone number is wrong';

  @override
  String required() => 'Required';

  @override
  String ip(String v) => 'Wrong IP address';

  @override
  String ipv6(String v) => 'Wrong IPv6 address';

  @override
  String url(String v) => 'Wrong URL address';
}
