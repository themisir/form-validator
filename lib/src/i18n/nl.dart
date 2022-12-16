import '../locale.dart';

class LocaleNl implements FormValidatorLocale {
  const LocaleNl();

  @override
  String name() => 'nl';

  @override
  String minLength(String v, int n) => 'Minimaal $n karakters verplicht';

  @override
  String maxLength(String v, int n) => 'Maximaal $n karakters verplicht';

  @override
  String email(String v) => 'Ongeldig e-mailadres';

  @override
  String phoneNumber(String v) => 'Ongeldig telefoonnummer';

  @override
  String required() => 'Verplicht veld';

  @override
  String ip(String v) => 'Ongeldig IP-adres';

  @override
  String ipv6(String v) => 'Ongeldig IPv6-adres';

  @override
  String url(String v) => 'Ongeldige URL';
}
