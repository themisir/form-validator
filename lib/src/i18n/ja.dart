import '../locale.dart';

class LocaleJa implements FormValidatorLocale {
  const LocaleJa();

  @override
  String name() => 'ja';

  @override
  String minLength(String v, int n) => '$n文字以上入力してください';

  @override
  String maxLength(String v, int n) => '最大$n文字以内で入力してください';

  @override
  String email(String v) => '有効なメールアドレスの形式ではありません';

  @override
  String phoneNumber(String v) => '有効な電話番号の形式ではありません';

  @override
  String required() => '必須項目です';

  @override
  String ip(String v) => '有効なIPアドレスの形式ではありません';

  @override
  String ipv6(String v) => '有効なIPv6の形式ではありません';

  @override
  String url(String v) => '有効なURLの形式ではありません';
}
