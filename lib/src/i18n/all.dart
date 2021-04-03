import '../form_validator_locale.dart';
import 'az.dart';
import 'de.dart';
import 'en.dart';
import 'id.dart';
import 'it.dart';
import 'fr.dart';
import 'pt_br.dart';
import 'tr.dart';
import 'zh_cn.dart';

FormValidatorLocale createLocale(String locale) {
  switch (locale) {
    case 'az':
      return LocaleAz();

    case 'de':
      return LocaleDe();

    case 'fr':
      return LocaleFr();

    case 'id':
      return LocaleId();

    case 'it':
      return LocaleIt();

    case 'tr':
      return LocaleTr();

    case 'pt-br':
      return LocalePtBr();

    case 'zh-CN':
      return LocaleZhCN();

    case 'en':
    case 'default':
      return LocaleEn();

    default:
      throw ArgumentError.value(
          locale, 'locale', 'Form validation locale is not available.');
  }
}
