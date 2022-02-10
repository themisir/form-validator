import '../locale.dart';

class LocalePl implements FormValidatorLocale {
  const LocalePl();

  @override
  String name() => 'pl';

  @override
  String minLength(String v, int n) => 'Minimalna ilość znaków to $n';

  @override
  String maxLength(String v, int n) => 'Maksymalna ilość znaków to $n';

  @override
  String email(String v) => 'Adres Email jest niepoprawny';

  @override
  String phoneNumber(String v) => 'Numer telefonu jest niepoprawny';

  @override
  String required() => 'To pole jest wymagane';

  @override
  String ip(String v) => 'adres IP jest niepoprawny';

  @override
  String ipv6(String v) => 'adres IPv6 jest niepoprawny';

  @override
  String url(String v) => 'adres URL jest niepoprawny';
}
