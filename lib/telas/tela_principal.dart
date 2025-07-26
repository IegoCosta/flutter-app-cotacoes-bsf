import 'package:flutter/material.dart';
import '../modelos/moeda.dart';
import '../servicos/cotacao_servico.dart';
import '../util/nomes_moedas.dart';
import 'tela_detalhes.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  late Future<List<Moeda>> _futureMoedas;

  @override
  void initState() {
    super.initState();
    _futureMoedas = CotacaoServico.buscarCotacoes();
  }

  void _atualizar() {
    setState(() {
      _futureMoedas = CotacaoServico.buscarCotacoes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cotações em Tempo Real'),
        actions: [
          IconButton(onPressed: _atualizar, icon: const Icon(Icons.refresh)),
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
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: moedas.length,
            separatorBuilder: (_, __) => const Divider(color: Colors.white24),
            itemBuilder: (context, index) {
              final moeda = moedas[index];
              final nome = nomesMoedas[moeda.codigo];
              final titulo = nome != null ? '$nome (${moeda.codigo})' : moeda.codigo;

              return Card(
                color: Colors.grey[900],
                elevation: 3,
                child: ListTile(
                  leading: Icon(Icons.currency_exchange, color: cor),
                  title: Text(titulo, style: const TextStyle(color: Colors.white)),
                  subtitle: Text('R\$ ${moeda.valor.toStringAsFixed(2)}'),
                  trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TelaDetalhes(moeda: moeda),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
