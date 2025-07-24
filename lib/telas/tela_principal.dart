import 'package:flutter/material.dart';
import '../modelos/moeda.dart';
import '../servicos/cotacao_servico.dart';
import '../util/nomes_moedas.dart';
import 'tela_detalhes.dart';

/// Tela principal que exibe a lista de cotações.
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cotações em Tempo Real'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _atualizar,
          )
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
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              final moeda = moedas[index];
              final nome = nomesMoedas[moeda.codigo];
              final titulo = nome != null ? '$nome - ${moeda.codigo}' : moeda.codigo;

              return ListTile(
                leading: const Icon(Icons.attach_money, color: Colors.blue),
                title: Text(titulo),
                trailing: Text(moeda.valor.toStringAsFixed(2)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TelaDetalhes(
                        codigo: moeda.codigo,
                        nomeCompleto: nome,
                        valor: moeda.valor,
                        data: moeda.data,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}