import '../locale.dart';

class LocaleTr implements FormValidatorLocale {
  const LocaleTr();

  @override
  String name() => 'tr';

  @override
  String minLength(String v, int n) => 'Bu alan en az $n karakter içermelidir';

  @override
  String maxLength(String v, int n) => 'Bu alan $n karakterden uzun olamaz';

  @override
  String email(String v) => 'Lütfen doğru bir E-Posta adresi girin';

  @override
  String phoneNumber(String v) => 'Lütfen doğru bir telefon numarası girin';

  @override
  String required() => 'Lütfen doldurun';

  @override
  String ip(String v) => 'IP adresi geçerli değil';

  @override
  String ipv6(String v) => 'IPv6 adresi geçerli değil';

  @override
  String url(String v) => 'URL adresi geçerli değil';
}
