import '../locale.dart';

class LocaleFA implements FormValidatorLocale {
  const LocaleFA();

  @override
  String name() => 'fa';

  @override
  String minLength(String v, int n) => 'وارد کردن حد اقل $n کاراکتر الزامی است';

  @override
  String maxLength(String v, int n) => 'وارد کردن بیش از $n کاراکتر مجاز نیست';

  @override
  String email(String v) => 'ایمیل آدرس نا معتبر میباشد';

  @override
  String phoneNumber(String v) => 'شماره تلفن نا معتبر میباشد';

  @override
  String required() => 'وارد کردن این قسمت الزامی است';

  @override
  String ip(String v) => 'آدرس آی پی نا معتبر میباشد';

  @override
  String ipv6(String v) => 'آدرس IPv6 نا معتبر میباشد';

  @override
  String url(String v) => 'آدرس وارد شده نا معتبر میباشد';

  @override
  String noMatch() => 'مقادیر با هم مطابقت ندارند';
}
