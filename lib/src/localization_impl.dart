import 'localization.dart';

class LocalizationImpl implements Localization {
  const LocalizationImpl(this.locales);

  final Map<String, LocaleData> locales;

  @override
  void addLocale(String localeKey, Map<String, String> messages) {
    if (locales.containsKey(localeKey)) {
      final locale = locales[localeKey];
      for (var kv in messages.entries) {
        locale.messages[kv.key] = kv.value;
      }
    } else {
      locales[localeKey] = LocaleData(localeKey, messages);
    }
  }

  @override
  void addMessage(String messageKey, Map<String, String> messages) {
    for (var kv in messages.entries) {
      if (locales.containsKey(kv.key)) {
        locales[kv.key].messages[messageKey] = kv.value;
      } else {
        locales[kv.key] = LocaleData(kv.key, <String, String>{
          messageKey: kv.value,
        });
      }
    }
  }
}
