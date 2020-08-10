import '../form_validator_locale.dart';

import 'az.dart';
import 'en.dart';
import 'fr.dart';
import 'tr.dart';

FormValidatorLocale createLocale(String locale) {
  switch (locale) {
    case 'az':
      return LocaleAz();

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
