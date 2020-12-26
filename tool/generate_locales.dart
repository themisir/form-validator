import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' show basenameWithoutExtension, join, normalize;

Directory get workdir {
  var dir = Directory.current;
  if (dir.path.endsWith('tool')) {
    return Directory(normalize(join(dir.path, '../lib/src/i18n/')));
  } else {
    return Directory(join(dir.path, 'lib/src/i18n/'));
  }
}

String stringfy(String source) {
  var quote = source.contains("'") ? '"' : "'";
  source = source.replaceAll(quote, '\\' + quote);
  source = source.replaceAll('\n', '\\n');
  return '${quote}${source}${quote}';
}

const header = '//////////////////////////////////////////////\n'
    '/////////////// GENERATED FILE ///////////////\n'
    '//////////////////////////////////////////////\n\n'
    "import '../localization.dart';\n\n";

void main() async {
  var buffer = StringBuffer(header);
  var locales = <String>[];
  var files = await workdir
      .list()
      .where((item) => item.path.endsWith('.json'))
      .toList();

  for (var item in files) {
    var language = basenameWithoutExtension(item.path);
    var contents = await File(item.path).readAsString();
    var map = json.decode(contents) as Map;

    buffer.writeln('final _${language}Messages = <String, String>{');
    for (var kv in map.entries) {
      buffer.writeln("  '${kv.key}': ${stringfy(kv.value)},");
    }
    buffer.writeln('};\n');

    locales.add(language);
  }

  buffer.writeln('final locales = <String, LocaleData>{');
  for (var locale in locales) {
    buffer.writeln("  '$locale': LocaleData('$locale', _${locale}Messages),");
  }
  buffer.writeln('};');

  var outFile = File(join(workdir.path, 'locales.g.dart'));
  await outFile.writeAsString(buffer.toString());
}
