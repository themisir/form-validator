import 'package:form_validator/form_validator.dart';
import 'package:form_validator/src/validator_options.dart';
import 'package:test/test.dart';

void main() {
  final cursedOptions = ValidatorOptions(
    emailRegExp: RegExp('abc'), // only accepts email containing 'abc'
    phoneRegExp: RegExp('123'), // only accepts phone number containing '123'
    ipv4RegExp: RegExp('not.ip'),
    ipv6RegExp: RegExp('not::ip'),
  );

  group('global options', () {
    setUp(() {
      ValidationBuilder.globalOptions = cursedOptions;
    });

    final builder = () => ValidationBuilder();

    test('email', () {
      expect(builder().email().test('user@example.org'), isNotNull);
    });

    test('phone', () {
      expect(builder().phone().test('+994000000000'), isNotNull);
    });

    test('ipv4', () {
      expect(builder().ip().test('127.0.0.1'), isNotNull);
    });

    test('ipv6', () {
      expect(builder().ip().test('1fca:2345::0'), isNotNull);
    });
  });

  group('local options', () {
    setUp(() {
      // reset global options to default state
      ValidationBuilder.globalOptions = ValidatorOptions();
    });

    final builder = () => ValidationBuilder(options: cursedOptions);

    test('email', () {
      expect(builder().email().test('user@example.org'), isNotNull);
    });

    test('phone', () {
      expect(builder().phone().test('+994000000000'), isNotNull);
    });

    test('ipv4', () {
      expect(builder().ip().test('127.0.0.1'), isNotNull);
    });

    test('ipv6', () {
      expect(builder().ip().test('1fca:2345::0'), isNotNull);
    });
  });
}
