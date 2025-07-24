/// Modelo que representa uma moeda com código, valor e data da cotação.
class Moeda {
  final String codigo;
  final double valor;
  final String data;

  Moeda({required this.codigo, required this.valor, required this.data});

  factory Moeda.fromJson(String codigo, dynamic valor, String data) {
    return Moeda(
      codigo: codigo,
      valor: valor.toDouble(),
      data: data,
    );
  }
}
