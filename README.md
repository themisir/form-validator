# form_validator

[![pub package](https://img.shields.io/pub/v/form_validator.svg)](https://pub.dev/packages/form_validator)
[![GitHub](https://img.shields.io/github/license/TheMisir/form-validator)](https://github.com/TheMisir/form-validator/blob/master/LICENSE)
[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/themisir/form-validator/test.yml?branch=master)](https://github.com/TheMisir/form-validator/actions)
[![codecov](https://codecov.io/gh/TheMisir/form-validator/branch/master/graph/badge.svg)](https://codecov.io/gh/TheMisir/form-validator)

Simplest form validation for flutter form widgets.

* Zero dependency
* Localization supported
* Extensible
* Well tested
* Open source

## Example

```dart
TextFormField(
  validator: ValidationBuilder().email().maxLength(50).build(),
  decoration: InputDecoration(labelText: 'Email'),
),
```
<a href="https://form-validator-example.netlify.app/" target="_blank">![live demo](https://img.shields.io/badge/open-live%20demo-blueviolet?style=for-the-badge&logo=netlify)</a>

## Getting Started

### Installation

Add `form_validator` as dependency to your flutter project by adding this lines to `pubspec.yaml`.

```yaml
dependencies:
  form_validator: ">=0.1.1 <2.0.0"
```

Then run `flutter pub get` to install required dependencies.

<small>Check [installation](https://pub.dev/packages/form_validator#-installing-tab-) tab for more information</small>

### Code

Import `form_validator` package to your dart widgets by writing:

```dart
import 'package:form_validator/form_validator.dart';
```

Now you can use [`ValidationBuilder`](https://pub.dev/documentation/form_validator/latest/form_validator/ValidationBuilder-class.html) class to create validation logic. Here's simple validator that validates if input length is between 10 and 50 characters long.

```dart
final validate = ValidationBuilder().minLength(10).maxLength(50).build();

print(validate('test'));        // Minimum length must be at least 10 characters
print(validate('Hello World')); // null, means value is correct
```
## Localization

You can set global locale using `ValidationBuilder.setLocale(String localeName)`
 or you can also define locale on `ValidationBuilder({ String localeName })` constructor.

```dart
ValidationBuilder.setLocale('en');

// will use *en* localization
ValidationBuilder()
  .minLength(5)
  .build();

// will use *az* localization
ValidationBuilder(localeName: 'az')
  .minLength(5)
  .build();

// will display custom message
ValidationBuilder()
  .minLength(5, 'Length < 5 😟')
  .build();
```
 
## Methods

### `.minLength(int minLength, [String message])`

Validates if value length is not less than `minLength`.

### `.maxLength(int maxLength, [String message])`

Validates if value length is not more than `maxLength`.

### `.email([String message])`

Checks if value is an email address.

### `.phone([String message])`

Checks if value is an phone number. 

> Note: This method might be changed in future.

### `.ip([String message])`

Checks if value is correct IPv4 address.

### `.ipv6([String message])`

Checks if value is correct IPv6 address.

### `.url([String message])`

Checks if value is correct url address.

### `.regExp(RegExp regExp, String message)`

Validates if value does matches `regExp` or not.

> `message` argument is required in this method.

### `.or(Action<ValidationBuilder> left, Action<ValidationBuilder> right, {bool reverse = false})`

Validates if value passes any of `left` and `right` validations. If value doesn't passes any error message from right validation will be displayed (If `reverse` set to true message from left validation will be displayed).

Example:

```dart
print(
  ValidationBuilder().or(
    (builder) => builder.email('not email'),
    (builder) => builder.phone('not phone'),
  )
  .test('invalid')
); // not phone

print(
  ValidationBuilder().or(
    (builder) => builder.email('not email'),
    (builder) => builder.phone('not phone'),
    reverse: true,
  )
  .test('invalid')
); // not email
```

## Notes

### `ValidationBuilder` is mutable.

You need to construct different instances for each validation.

#### <img src="https://via.placeholder.com/15/f03c15/000000?text=+" /> Wrong

```dart
final builder = ValidationBuilder().email();

TextFormField(
  validator: builder.maxLength(50).build(),
),
TextFormField(
  validator: builder.maxLength(20).build(),
),
```

#### <img src="https://via.placeholder.com/15/c5f015/000000?text=+" /> Correct

```dart
final validator1 = ValidationBuilder().email().maxLength(50).build();
final validator2 = ValidationBuilder().email().maxLength(20).build();

TextFormField(
  validator: validator1,
),
TextFormField(
  validator: validator2,
),
```


### Add custom localization

Firstly you need to extend abstract [`FormValidatorLocale`](https://pub.dev/documentation/form_validator/latest/form_validator/FormValidatorLocale-class.html) class.

```dart
import 'package:form_validator/form_validator.dart';

class MyValidationLocale extends FormValidatorLocale {
  @override
  String name() => "custom";

  @override
  String required() => "Field is required";

  ...
}
```

<small><b>PROTIP:</b> You can copy a language file from [/lib/src/i18n](https://github.com/TheMisir/form-validator/tree/master/lib/src/i18n) folder and modify messages as you want.</small>

Then you can use your custom locale class as global or local validation locale.

```dart
// global locale
void main() {
  ValidationBuilder.globalLocale = MyValidationLocale();
  ...
}

// local locale
final locale = MyValidationLocale();

build(BuildContext context) {
  final emailValidator = ValidationBuilder(locale: locale)
    .email()
    .build();
  ...
}
```

<small><b>PROTIP:</b> Feel free to add your locale to library by opening pull request  [TheMisir/form-validator](https://github.com/TheMisir/form-validator) to support library.</small>

### Extending `ValidationBuilder`

You can use dart [`extension methods`](https://dart.dev/guides/language/extension-methods) to extend `ValidationBuilder`.

```dart
extension CustomValidationBuilder on ValidationBuilder {
  password() => add((value) {
    if (value == 'password') {
      return 'Password should not "password"';
    }
    return null;
  });
}

final validator = ValidationBuilder().password().build();
```

## Support

If you would like to support this library you could translate messages to your own language.
