import '../form_validator_locale.dart';

import 'az.dart';
import 'de.dart';
import 'en.dart';
import 'fr.dart';
import 'tr.dart';

FormValidatorLocale createLocale(String locale) {
  switch (locale) {
    case 'az':
      return LocaleAz();

    case 'de':
      return LocaleDe();

    case 'fr':
      return LocaleFr();

    case 'tr':
      return LocaleTr();

    case 'en':
    case 'default':
      return LocaleEn();

    default:
      throw ArgumentError.value(
          locale, 'locale', 'Form validation locale is not available.');
  }
}
