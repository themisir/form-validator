import '../locale.dart';

class LocaleDe implements FormValidatorLocale {
  const LocaleDe();

  @override
  String name() => 'de';

  @override
  String minLength(String v, int n) =>
      'Es sind mindestens $n Zeichen erforderlich';

  @override
  String maxLength(String v, int n) => 'Es sind maximal $n Zeichen erlaubt';

  @override
  String email(String v) => 'Dies ist keine gültige E-Mail';

  @override
  String phoneNumber(String v) => 'Dies ist keine gültige Telefonnummer';

  @override
  String required() => 'Dieses Feld ist erforderlich';

  @override
  String ip(String v) => 'Dies ist keine gütlige IP-Adresse';

  @override
  String ipv6(String v) => 'Dies ist keine gütlige IPv6-Adresse';

  @override
  String url(String v) => 'Dies ist keine gültige URL';
}
