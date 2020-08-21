import '../form_validator_locale.dart';

class LocaleTr extends FormValidatorLocale {
  @override
  String name() => 'tr';

  @override
  String notBlank() => required();

  @override
  String minLength(String v, int n) => 'Bu alan en az $n harf olmalı';

  @override
  String maxLength(String v, int n) => 'Bu alan en fazla $n harf olmalı';

  @override
  String email(String v) => 'Email adresi geçerli değil';

  @override
  String phoneNumber(String v) => 'Telefon numarası geçerli değil';

  @override
  String required() => 'Bu alan zorunludur';

  @override
  String ip(String v) => 'IP adresi geçerli değil';

  @override
  String ipv6(String v) => 'IPv6 adresi geçerli değil';

  @override
  String url(String v) => 'URL adresi geçerli değil';
}
