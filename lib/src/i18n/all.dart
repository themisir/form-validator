import 'package:form_validator/src/i18n/pl.dart';

import '../form_validator_locale.dart';
import 'az.dart';
import 'de.dart';
import 'en.dart';
import 'fr.dart';
import 'id.dart';
import 'it.dart';
import 'pt_br.dart';
import 'tr.dart';
import 'zh_cn.dart';

const supportedLocales = <String>{
  'az',
  'de',
  'fr',
  'id',
  'it',
  'tr',
  'pt-br',
  'pl',
  'zh-cn',
  'en',
};

const localeMap = <String, FormValidatorLocale>{
  'az': LocaleAz(),
  'de': LocaleDe(),
  'fr': LocaleFr(),
  'id': LocaleId(),
  'it': LocaleIt(),
  'tr': LocaleTr(),
  'pt-br': LocalePtBr(),
  'pl': LocalePl(),
  'zh-cn': LocaleZhCN(),
  'en': LocaleEn(),
};

FormValidatorLocale createLocale(String locale) {
  if (locale == 'default') locale = 'en';

  final result = localeMap[locale];
  if (result != null) return result;

  throw ArgumentError.value(
    locale,
    'locale',
    'Form validation locale is not yet supported.',
  );
}
