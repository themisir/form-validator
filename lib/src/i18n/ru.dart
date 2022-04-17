import '../locale.dart';

class LocaleRu implements FormValidatorLocale {
  const LocaleRu();

  @override
  String name() => 'ru';

  @override
  String minLength(String v, int n) =>
      'Поле должно содержать не менее $n символов';

  @override
  String maxLength(String v, int n) =>
      'Поле должно содержать не более $n символов';

  @override
  String email(String v) => 'Неверный адрес почты';

  @override
  String phoneNumber(String v) => 'Неверный номер телефона';

  @override
  String required() => 'Поле обязательно для заполнения';

  @override
  String ip(String v) => 'Неверный IP адрес';

  @override
  String ipv6(String v) => 'Неверный IPv6 адрес';

  @override
  String url(String v) => 'Неверный URL адрес';
}
