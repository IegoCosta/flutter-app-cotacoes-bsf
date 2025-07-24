import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modelos/moeda.dart';

/// Classe de serviço que busca as cotações da API.
class CotacaoServico {
  static Future<List<Moeda>> buscarCotacoes() async {
    const url = 'https://api.exchangerate-api.com/v4/latest/USD';
    final resposta = await http.get(Uri.parse(url));

    if (resposta.statusCode == 200) {
      final dados = json.decode(resposta.body);
      final taxas = dados['rates'] as Map<String, dynamic>;
      final data = dados['date'] ?? '';

      return taxas.entries.map((entry) {
        return Moeda.fromJson(entry.key, entry.value, data);
      }).toList();
    } else {
      throw Exception('Erro ao carregar cotações');
    }
  }
}