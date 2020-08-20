import 'package:form_validator/form_validator.dart';
import 'package:form_validator/src/localization.dart';
import 'package:test/test.dart';

final availableLocales = ['az', 'en', 'tr', 'fr', 'de'];

void validateLocale(ValidationBuilder builder, LocaleData locale) {
  expect(builder.reset().required().test(null), equals(locale.get('required')));
  expect(builder.reset().minLength(5).test('abc'),
      equals(locale.get('minLength', {'min': 5})));
  expect(builder.reset().maxLength(1).test('abc'),
      equals(locale.get('maxLength', {'max': 1})));
  expect(builder.reset().email().test('abc'), equals(locale.get('email')));
  expect(
      builder.reset().phone().test('abc'), equals(locale.get('phoneNumber')));
  expect(builder.reset().url().test('abc'), equals(locale.get('url')));
  expect(builder.reset().ip().test('abc'), equals(locale.get('ip')));
  expect(builder.reset().ipv6().test('abc'), equals(locale.get('ipV6')));
}

void main() {
  test('global locale by name', () {
    availableLocales.forEach((item) {
      ValidationBuilder.setLocale(item);
      validateLocale(ValidationBuilder(), FormValidator.locales[item]);
    });
  });

  test('local locale by name', () {
    availableLocales.forEach((key) {
      validateLocale(
        ValidationBuilder(localeName: key),
        FormValidator.locales[key],
      );
    });
  });

  test('local locale', () {
    availableLocales.forEach((key) {
      validateLocale(ValidationBuilder(locale: FormValidator.locales[key]),
          FormValidator.locales[key]);
    });
  });

  test('invalid locale', () {
    expect(() => ValidationBuilder(localeName: 'invalid'), throwsArgumentError);
  });
}
