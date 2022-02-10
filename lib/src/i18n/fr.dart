import '../locale.dart';

class LocaleFr implements FormValidatorLocale {
  const LocaleFr();

  @override
  String name() => 'fr';

  @override
  String minLength(String v, int n) =>
      "Le champ doit contenir au moins $n caractère${n > 1 ? 's' : ''}";

  @override
  String maxLength(String v, int n) =>
      "Le champ ne peut pas contenir plus de $n caractère${n > 1 ? 's' : ''}";

  @override
  String email(String v) => 'Adresse email invalide';

  @override
  String phoneNumber(String v) => 'Numéro de téléphone invalide';

  @override
  String required() => 'Le champ est requis';

  @override
  String ip(String v) => "Le champ n'est pas une adresse IP valide";

  @override
  String ipv6(String v) => "Le champ n'est pas une adresse IPv6 valide";

  @override
  String url(String v) => "Le champ n'est pas une URL valide";
}
