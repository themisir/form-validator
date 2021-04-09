abstract class FormValidatorLocale {
  String name();
  String required();
  String minLength(String v, int n);
  String maxLength(String v, int n);
  String email(String v);
  String phoneNumber(String v);
  String ip(String v);
  String ipv6(String v);
  String url(String v);
}
