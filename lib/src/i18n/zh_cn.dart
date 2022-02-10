import '../locale.dart';

class LocaleZhCN implements FormValidatorLocale {
  const LocaleZhCN();

  @override
  String name() => 'zh-cn';

  @override
  String minLength(String v, int n) => '此字段必须包含至少$n个字节';

  @override
  String maxLength(String v, int n) => '此字段必须包含至多$n个字节';

  @override
  String email(String v) => '此字段不是一个有效的邮箱地址';

  @override
  String phoneNumber(String v) => '此字段不是一个有效的电话号码';

  @override
  String required() => '此字段是必填项';

  @override
  String ip(String v) => '此字段不是一个有效的IP地址';

  @override
  String ipv6(String v) => '此字段不是一个有效的IPv6地址';

  @override
  String url(String v) => '此字段不是一个有效的统一资源定位器（URL）地址';
}
