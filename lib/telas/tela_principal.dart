import 'package:flutter/material.dart';
import '../modelos/moeda.dart';
import '../servicos/cotacao_servico.dart';
import '../util/nomes_moedas.dart';

/// Tela principal que exibe todas as cotações da API com nome completo quando possível.
class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  late Future<List<Moeda>> _futureMoedas;
  String moedaBase = 'USD';

  @override
  void initState() {
    super.initState();
    _futureMoedas = CotacaoServico.buscarCotacoes();
  }

  /// Atualiza os dados da API.
  void _atualizarCotacoes() {
    setState(() {
      _futureMoedas = CotacaoServico.buscarCotacoes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cotações em Tempo Real'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Atualizar',
            onPressed: _atualizarCotacoes,
          ),
        ],
      ),
      body: FutureBuilder<List<Moeda>>(
        future: _futureMoedas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }

          final moedas = snapshot.data!;
          return Column(
            children: [
              const SizedBox(height: 16),
              Text(
                'Base de Cotações: $moedaBase',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Divider(),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: moedas.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    final moeda = moedas[index];
                    final nomeCompleto = nomesMoedas[moeda.codigo];
                    final titulo = nomeCompleto != null
                        ? '$nomeCompleto - ${moeda.codigo}'
                        : moeda.codigo;

                    return ListTile(
                      leading: const Icon(Icons.monetization_on, color: Colors.blue),
                      title: Text(titulo),
                      trailing: Text(
                        moeda.valor.toStringAsFixed(2),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: _atualizarCotacoes,
                icon: const Icon(Icons.refresh),
                label: const Text('Atualizar Cotações'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}
