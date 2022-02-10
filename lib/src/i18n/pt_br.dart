import '../locale.dart';

class LocalePtBr implements FormValidatorLocale {
  const LocalePtBr();

  @override
  String name() => 'pt-br';

  @override
  String minLength(String v, int n) =>
      'O campo deve ter pelo menos $n caracteres';

  @override
  String maxLength(String v, int n) =>
      'O campo deve ter no máximo $n caracteres';

  @override
  String email(String v) => 'O e-mail informado não é valido';

  @override
  String phoneNumber(String v) => 'O telefone informado não é valido';

  @override
  String required() => 'Campo obrigatório';

  @override
  String ip(String v) => 'O IP informado não é valido';

  @override
  String ipv6(String v) => 'O IPv6 informado não é valido';

  @override
  String url(String v) => 'A URL informada não é valida';
}
