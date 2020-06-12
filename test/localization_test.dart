import 'package:form_validator/form_validator.dart';
import 'package:form_validator/src/i18n/az.dart';
import 'package:form_validator/src/i18n/en.dart';
import 'package:test/test.dart';

final availableLocales = <String, FormValidatorLocale>{
  'az': LocaleAz(),
  'en': LocaleEn(),
};

void main() {
  test('global locale by name', () {
    availableLocales.forEach((key, value) {
      ValidationBuilder.setLocale(key);
      expect(
        ValidationBuilder().minLength(5).test('hey'),
        equals(value.minLength('hey', 5)),
      );
    });
  });

  test('global locale', () {
    availableLocales.values.forEach((value) {
      ValidationBuilder.globalLocale = value;
      expect(
        ValidationBuilder().minLength(5).test('hey'),
        equals(value.minLength('hey', 5)),
      );
    });
  });

  test('local locale by name', () {
    availableLocales.forEach((key, value) {
      expect(
        ValidationBuilder(localeName: key).minLength(5).test('hey'),
        equals(value.minLength('hey', 5)),
      );
    });
  });

  test('local locale', () {
    availableLocales.values.forEach((value) {
      expect(
        ValidationBuilder(locale: value).minLength(5).test('hey'),
        equals(value.minLength('hey', 5)),
      );
    });
  });
}
