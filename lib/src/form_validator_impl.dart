import 'package:form_validator/src/localization.dart';
import 'package:form_validator/src/localization_impl.dart';
import 'i18n/locales.g.dart';

class FormValidatorImpl extends LocalizationImpl {
  FormValidatorImpl() : super(locales) {
    _locale = locales['en'];
  }

  LocaleData _locale;

  /// Get global locale
  LocaleData get locale => _locale;

  /// Get locale data
  LocaleData getLocale(String localeKey) => locales[localeKey];

  /// Change global locale
  void setLocale(String localeKey) {
    _locale = locales[localeKey];
  }
}
