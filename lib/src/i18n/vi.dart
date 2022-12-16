import '../locale.dart';

class LocaleVi implements FormValidatorLocale {
  const LocaleVi();

  @override
  String name() => 'vi';

  @override
  String minLength(String v, int n) => 'Trường này phải ít nhất $n ký tự';

  @override
  String maxLength(String v, int n) => 'Trường này phải dài tối đa $n ký tự';

  @override
  String email(String v) => 'Email không hợp lệ';

  @override
  String phoneNumber(String v) => 'Số điện thoại không hợp lệ';

  @override
  String required() => 'Trường này là bắt buộc';

  @override
  String ip(String v) => 'Địa chỉ IP không hợp lệ';

  @override
  String ipv6(String v) => 'Địa chỉ IPv6 không hợp lệ';

  @override
  String url(String v) => 'Địa chỉ URL không hợp lệ';
}
