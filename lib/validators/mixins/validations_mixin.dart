mixin ValidationsMixin {
  String? isNotEmpty(String? value, [String? message]) {
    if (value!.isEmpty) return message ?? 'Campo obrigatório';
    return null;
  }

  String? hasMinChars(String? value, int minChars, [String? message]) {
    if (value!.length < minChars) {
      return message ?? 'Campo deve ter no mínimo $minChars caracteres';
    }
    return null;
  }

  String? isEmail(String? value, [String? message]) {
    if (!isEmailValid(value!)) return message ?? 'E-mail inválido';
    return null;
  }

  String? isCPF(String? value, [String? message]) {
    if (!isCPFValid(value!)) return message ?? 'CPF inválido';
    return null;
  }

  String? isTelefone(String? value, [String? message]) {
    if (!isTelefoneValid(value!)) return message ?? 'Telefone inválido';
    return null;
  }

  String? combine(List<String? Function()> validators) {
    for (var validator in validators) {
      var error = validator();
      if (error != null) return error;
    }
    return null;
  }

  bool isEmailValid(String email) {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }

  bool isCPFValid(String cpf) {
    return RegExp(r'^\d{3}\.\d{3}\.\d{3}-\d{2}$').hasMatch(cpf);
  }

  bool isTelefoneValid(String telefone) {
    // telefone pode ter 8 ou 9 dígitos
    return RegExp(r'^\(\d{2}\) \d{4,5}-\d{4}$').hasMatch(telefone);
  }
}
