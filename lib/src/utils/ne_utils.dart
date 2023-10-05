class NepaliLangUtils {
  static getNepaliNumber(int num) {
    final List<String> nepaliDigits = [
      '०',
      '१',
      '२',
      '३',
      '४',
      '५',
      '६',
      '७',
      '८',
      '९'
    ];

    String result = '';
    String numberString = num.toString();

    for (int i = 0; i < numberString.length; i++) {
      int digit = int.parse(numberString[i]);
      result += nepaliDigits[digit];
    }

    return result;
  }
}
