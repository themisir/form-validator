class LocaleData {
  const LocaleData(this.name, this.messages);

  /// Locale name
  final String name;

  /// Messages map
  ///
  /// ```dart
  /// messages['min_length'] = 'Min length should be {min}';
  /// ```
  final Map<String, String> messages;

  static const String en = 'en';

  String get(String messageKey, [Map<String, dynamic> arguments]) {
    var result = messages[messageKey];
    if (arguments != null) {
      for (var kv in arguments.entries) {
        result = result.replaceAll('{${kv.key}}', kv.value.toString());
      }
    }
    return result;
  }
}

abstract class Localization {
  void addLocale(String localeKey, Map<String, String> messages);
  void addMessage(String messageKey, Map<String, String> messages);
}
