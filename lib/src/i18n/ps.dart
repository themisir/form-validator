import '../locale.dart';

class LocalePS implements FormValidatorLocale {
  const LocalePS();

  @override
  String name() => 'ps';

  @override
  String minLength(String v, int n) => 'لږ تر لږه $n توري باید ولیکی';

  @override
  String maxLength(String v, int n) => 'د $n څخه زیات توري نشي ولیکل';

  @override
  String email(String v) => 'ناسم بریښنالیک';

  @override
  String phoneNumber(String v) => 'ناسم تلیفون شمیره';

  @override
  String required() => 'دا ځای باید ډک شي';

  @override
  String ip(String v) => 'ناسم IP پته';

  @override
  String ipv6(String v) => 'ناسم IPv6 پته';

  @override
  String url(String v) => 'ناسم انټرنټ پته';

  @override
  String noMatch() => 'ارزښتونه سم مطابقت نه لري';
}
