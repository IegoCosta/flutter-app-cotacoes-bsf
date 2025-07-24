/// Representa uma moeda com código e valor.
class Moeda {
  final String codigo;
  final double valor;

  Moeda({required this.codigo, required this.valor});

  factory Moeda.fromJson(String codigo, dynamic valor) {
    return Moeda(codigo: codigo, valor: valor.toDouble());
  }
}
