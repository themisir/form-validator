import '../locale.dart';

class LocaleId implements FormValidatorLocale {
  const LocaleId();

  @override
  String name() => 'id';

  @override
  String minLength(String v, int n) =>
      'Masukan harus diisi minimum $n karakter';

  @override
  String maxLength(String v, int n) => 'Masukan harus kurang dari $n karakter';

  @override
  String email(String v) => 'Masukan bukan email yang benar';

  @override
  String phoneNumber(String v) => 'Masukan bukan nomor handphone yang benar';

  @override
  String required() => 'Masukan tidak boleh kosong';

  @override
  String ip(String v) => 'Masukan bukan alamat IP yang benar';

  @override
  String ipv6(String v) => 'Masukan bukan alamat IPv6 yang benar';

  @override
  String url(String v) => 'Masukan bukan alamat URL yang benar';
}
