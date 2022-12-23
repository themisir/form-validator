import '../locale.dart';

class LocaleAr implements FormValidatorLocale {
  const LocaleAr();

  @override
  String name() => 'ar';

  @override
  String minLength(String v, int n) =>
      'يجب أن يكون عدد الأحرف على الأقل $n حروف';

  @override
  String maxLength(String v, int n) =>
      'يجب أن لا يزيد عدد الأحرف عن $n حرف';


  @override
  String email(String v) => 'برجاء إدخال عنوان بريد إلكتروني صحيح';

  @override
  String phoneNumber(String v) => 'برجاء إدخال رقم هاتف صحيح';

  @override
  String required() => 'برجاء ملء هذه الخانة';

  @override
  String ip(String v) => 'برجاء إدخال عنوان IP صحيح';

  @override
  String ipv6(String v) => 'برجاء إدخال عنوان IPv6 صحيح';

  @override
  String url(String v) => 'برجاء إدخال عنوان URL صحيح';
}
