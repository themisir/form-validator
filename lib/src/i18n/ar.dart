import '../locale.dart';

class LocaleAr implements FormValidatorLocale {
  const LocaleAr();

  @override
  String name() => 'ar';

  @override
  String minLength(String v, int n) =>
      'يجب أن يكون عدد الأحرف على الأقل $n حرفًا';

  @override
  String maxLength(String v, int n) =>
      'يجب ألا يزيد عدد الأحرف عن $n حرفًا';

  @override
  String email(String v) => 'يرجى إدخال عنوان بريد إلكتروني صحيح';

  @override
  String phoneNumber(String v) => 'يرجى إدخال رقم هاتف صحيح';

  @override
  String required() => 'يرجى ملء هذه الخانة';

  @override
  String ip(String v) => 'يرجى إدخال عنوان IP صحيح';

  @override
  String ipv6(String v) => 'يرجى إدخال عنوان IPv6 صحيح';

  @override
  String url(String v) => 'يرجى إدخال عنوان URL صحيح';
}
