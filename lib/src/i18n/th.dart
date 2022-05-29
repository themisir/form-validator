import '../locale.dart';

class LocaleTh implements FormValidatorLocale {
  const LocaleTh();

  @override
  String name() => 'th';

  @override
  String minLength(String v, int n) =>
      'ความยาวอย่างน้อย $n อักขระ';

  @override
  String maxLength(String v, int n) =>
      'ความยาวไม่เกิน $n อักขระ';

  @override
  String email(String v) => 'ที่อยู่อีเมลที่ถูกต้อง';

  @override
  String phoneNumber(String v) => 'หมายเลขโทรศัพท์ไม่ถูกต้อง';

  @override
  String required() => 'โปรดระบุข้อมูล';

  @override
  String ip(String v) => 'ที่อยู่ IP ไม่ถูกต้อง';

  @override
  String ipv6(String v) => 'ที่อยู่ IPv6 ไม่ถูกต้อง';

  @override
  String url(String v) => 'ที่อยู่ URL ไม่ถูกต้อง';
}
