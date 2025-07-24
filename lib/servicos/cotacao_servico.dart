import 'dart:convert';          // Para manipular JSON
import 'package:http/http.dart' as http;  // Para fazer requisições HTTP
import '../modelos/moeda.dart';

/// Serviço responsável por buscar dados de cotações na API
class CotacaoServico {
  /// Método que busca as cotações na API pública e retorna lista de moedas
  static Future<List<Moeda>> buscarCotacoes() async {
    const url = 'https://api.exchangerate-api.com/v4/latest/USD';
    final resposta = await http.get(Uri.parse(url));

    // Se a resposta foi bem sucedida
    if (resposta.statusCode == 200) {
      final dados = json.decode(resposta.body);
      final taxas = dados['rates'] as Map<String, dynamic>;

      // Converte cada entrada da taxa para um objeto Moeda
      return taxas.entries
          .map((entrada) => Moeda.fromJson(entrada.key, entrada.value))
          .toList();
    } else {
      // Caso ocorra erro, lança exceção para ser capturada pela UI
      throw Exception('Erro ao carregar as cotações.');
    }
  }
}
