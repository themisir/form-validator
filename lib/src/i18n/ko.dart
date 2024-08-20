import '../locale.dart';

class LocaleKo implements FormValidatorLocale {
  const LocaleKo();

  @override
  String name() => 'ko';
  @override
  String required() => '이 항목을 입력해주세요.';
  @override
  String minLength(String v, int n) => '이 항목은 $n자 이상으로 입력해주세요';
  @override
  String maxLength(String v, int n) => '이 항목은 최대 $n자 이내로 입력해주세요';
  @override
  String email(String v) => '올바른 이메일주소를 입력해주세요';
  @override
  String phoneNumber(String v) => '올바른 전화번호를 입력해주세요';
  @override
  String ip(String v) => '올바른 IP주소를 입력해주세요';
  @override
  String ipv6(String v) => '올바른 IPv6주소를 입력해주세요';
  @override
  String url(String v) => '올바른 URL주소를 입력해주세요';

  @override
  String noMatch() => "값이 일치하지 않습니다";
}
