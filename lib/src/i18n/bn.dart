import '../locale.dart';

class LocaleBn implements FormValidatorLocale {
  const LocaleBn();

  @override
  String name() => 'bn';

  @override
  String minLength(String v, int n) => 'এই ফিল্ডটির কমপক্ষে $n-টি শব্দ প্রয়োজন';

  @override
  String maxLength(String v, int n) =>
      'এই ফিল্ডটির সর্বোচ্চ $n-টি শব্দ হতে পারবে';

  @override
  String email(String v) => 'এটি একটি ভুল ইমেইল ঠিকানা';

  @override
  String phoneNumber(String v) => 'এটি একটি ভুল নাম্বার';

  @override
  String required() => 'এই ফিল্ডটি প্রয়োজন';

  @override
  String ip(String v) => 'এটি একটি বৈধ আইপি ঠিকানা নয়';

  @override
  String ipv6(String v) => 'এটি একটি বৈধ IPv6 ঠিকানা নয়';

  @override
  String url(String v) => 'এটি একটি বৈধ URL ঠিকানা নয়';
}
