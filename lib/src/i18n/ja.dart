import '../locale.dart';

class LocaleJa implements FormValidatorLocale {
  const LocaleJa();

  @override
  String name() => 'ja';

  @override
  String minLength(String v, int n) => 'フィールドは$n文字以上である必要があります';

  @override
  String maxLength(String v, int n) => 'フィールドの長さは最大$n文字である必要があります';

  @override
  String email(String v) => '有効なメールアドレスではありません';

  @override
  String phoneNumber(String v) => '有効な電話番号ではありません';

  @override
  String required() => 'は必須項目です';

  @override
  String ip(String v) => '有効なIPではありません';

  @override
  String ipv6(String v) => '有効なIPv6xではありません';

  @override
  String url(String v) => '有効なxxxではありません';
}
