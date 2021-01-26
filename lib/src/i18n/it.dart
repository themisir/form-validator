import '../form_validator_locale.dart';

class LocaleIt extends FormValidatorLocale {
  @override
  String name() => 'it';

  @override
  String minLength(String v, int n) =>
      'Il campo deve contenere almeno $n caratteri';

  @override
  String maxLength(String v, int n) =>
      'Il campo può contenere al massimo $n caratteri';

  @override
  String email(String v) => 'Il campo non è un indirizzo e-mail valido';

  @override
  String phoneNumber(String v) => 'Il campo non è un numero di telefono valido';

  @override
  String required() => 'Campo obbligatorio';

  @override
  String ip(String v) => 'Il campo non è un indirizzo IP valido';

  @override
  String ipv6(String v) => 'Il campo non è un indirizzo IPv6 valido';

  @override
  String url(String v) => 'Il campo non è un indirizzo URL valido';
}
