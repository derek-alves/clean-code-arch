class Cpf {
  String value = '';

  Cpf(String cpf) {
    if (!validate(cpf)) throw Exception('Inalid cpf');
    value = cpf;
  }
  static bool validate(String rawCpf) {
    if (rawCpf.isEmpty) return false;
    String cpf = _clean(rawCpf);
    if (!_isValidLength(cpf)) return false;
    if (_isOneCaracter(cpf)) return false;

    num digit1 = _calculateDigit(cpf, 10);
    num digit2 = _calculateDigit(cpf, 11);

    String actualDigit = cpf.substring(9);
    String calculatedDigit = '$digit1$digit2';
    return actualDigit == calculatedDigit;
  }

  static String _clean(String cpf) => cpf.replaceAll(RegExp(r"[^\s\w]"), '');
  static bool _isValidLength(String cpf) => cpf.length == 11;
  static bool _isOneCaracter(String cpf) =>
      cpf.split("").every((digit) => digit == cpf[0]);

  static num _calculateDigit(String cpf, int factor) {
    int total = 0;
    for (var digit in cpf.split('')) {
      if (factor > 1) total += int.parse(digit) * factor--;
    }
    num rest = total % 11;
    return (rest < 2) ? 0 : 11 - rest;
  }
}
