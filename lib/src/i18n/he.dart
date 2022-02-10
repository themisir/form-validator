import '../locale.dart';

class LocaleHe implements FormValidatorLocale {
  const LocaleHe();

  @override
  String name() => 'he';

  @override
  String minLength(String v, int n) => 'השדה חייב להכיל לפחות $n תווים';

  @override
  String maxLength(String v, int n) => 'השדה חייב להכיל פחות מ- $n תווים';

  @override
  String email(String v) => 'השדה מכיל כתובת מייל לא תקינה';

  @override
  String phoneNumber(String v) => 'השדה מכיל מספר טלפון לא תקין';

  @override
  String required() => 'שדה זה הוא שדה חובה';

  @override
  String ip(String v) => 'השדה מכיל כתובת IP לא תקינה';

  @override
  String ipv6(String v) => 'השדה מכיל כתובת IPv6 לא תקינה';

  @override
  String url(String v) => 'השדה מכיל כתובת URL לא תקינה';
}
