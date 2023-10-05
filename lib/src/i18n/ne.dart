import '../locale.dart';
import '../utils/ne_utils.dart';

class LocaleNe implements FormValidatorLocale {
  const LocaleNe();

  @override
  String name() => 'ne';

  @override
  String minLength(String v, int n) => 'फिल्डमा कम्तिमा ${NepaliLangUtils.getNepaliNumber(n)} अक्षर हुनुपर्छ';

  @override
  String maxLength(String v, int n) => 'फिल्डमा अधिकतम ${NepaliLangUtils.getNepaliNumber(n)} अक्षरलाई मात्र हुनुपर्छ';

  @override
  String email(String v) => 'यो फिल्ड मान्य इमेल ठेगाना होइन';

  @override
  String phoneNumber(String v) => 'यो फिल्ड मान्य फोन नम्बर होइन';

  @override
  String required() => 'यो फिल्ड आवश्यक छ';

  @override
  String ip(String v) => 'यो फिल्ड मान्य आईपी ठेगाना होइन';

  @override
  String ipv6(String v) => 'यो फिल्ड मान्य आईपीभि ६ ठेगाना होइन';

  @override
  String url(String v) => 'यो फिल्ड मान्य यूआरएल ठेगाना होइन';
}
