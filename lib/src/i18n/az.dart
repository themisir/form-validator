import '../locale.dart';

class LocaleAz implements FormValidatorLocale {
  const LocaleAz();

  @override
  String name() => 'az';

  @override
  String minLength(String v, int n) => 'Minimum yazı uzunluğu $n olmalıdır';

  @override
  String maxLength(String v, int n) => 'Maksimum yazı uzunluğu $n olmalıdır';

  @override
  String email(String v) => 'Email düzgün deyil';

  @override
  String phoneNumber(String v) => 'Telefon nomrəsi yanlışdır';

  @override
  String required() => 'Boş qoymaq olmaz';

  @override
  String ip(String v) => 'IP ünvanı düzgün deyil';

  @override
  String ipv6(String v) => 'IPv6 ünvanı düzgün deyil';

  @override
  String url(String v) => 'URL ünvanı düzgün deyil';
}
