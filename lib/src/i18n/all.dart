import '../locale.dart';
import 'ar.dart';
import 'az.dart';
import 'ca_es.dart';
import 'de.dart';
import 'en.dart';
import 'es.dart';
import 'fa.dart';
import 'fr.dart';
import 'he.dart';
import 'id.dart';
import 'it.dart';
import 'ja.dart';
import 'nl.dart';
import 'pl.dart';
import 'ps.dart';
import 'pt_br.dart';
import 'ro.dart';
import 'ru.dart';
import 'th.dart';
import 'tr.dart';
import 'vi.dart';
import 'zh_cn.dart';
import 'bn.dart';
import 'ko.dart';

const localeMap = <String, FormValidatorLocale>{
  'ar': LocaleAr(),
  'az': LocaleAz(),
  'bn': LocaleBn(),
  'ca-es': LocaleCaEs(),
  'de': LocaleDe(),
  'es': LocaleEs(),
  'fr': LocaleFr(),
  'id': LocaleId(),
  'it': LocaleIt(),
  'tr': LocaleTr(),
  'pt-br': LocalePtBr(),
  'ru': LocaleRu(),
  'pl': LocalePl(),
  'zh-cn': LocaleZhCN(),
  'en': LocaleEn(),
  'he': LocaleHe(),
  'ja': LocaleJa(),
  'th': LocaleTh(),
  'vi': LocaleVi(),
  'ro': LocaleRo(),
  'nl': LocaleNl(),
  'ko': LocaleKo(),
  'fa': LocaleFA(),
  'ps': LocalePS(),
};

final supportedLocales = localeMap.keys.toList();

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
