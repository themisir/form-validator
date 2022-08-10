import '../locale.dart';

class LocaleRo implements FormValidatorLocale {
  const LocaleRo();

  @override
  String name() => 'ro';

  @override
  String minLength(String v, int n) =>
      'Câmpul trebuie să aibă cel puțin $n caractere';

  @override
  String maxLength(String v, int n) =>
      'Câmpul trebuie să aibă cel mult $n caractere';

  @override
  String email(String v) => 'Câmpul nu este o adresă de e-mail validă';

  @override
  String phoneNumber(String v) => 'Câmpul nu este un număr de telefon valid';

  @override
  String required() => 'Câmpul este obligatoriu';

  @override
  String ip(String v) => 'Câmpul nu este o adresă IP validă';

  @override
  String ipv6(String v) => 'Câmpul nu este o adresă IPv6 validă';

  @override
  String url(String v) => 'Câmpul nu este o adresă URL validă';
}
