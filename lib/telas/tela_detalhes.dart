import 'package:flutter/material.dart';
import '../modelos/moeda.dart';
import '../util/nomes_moedas.dart';

class TelaDetalhes extends StatelessWidget {
  final Moeda moeda;

  const TelaDetalhes({super.key, required this.moeda});

  @override
  Widget build(BuildContext context) {
    final cor = Theme.of(context).colorScheme.primary;
    final nome = nomesMoedas[moeda.codigo];
    final titulo = nome != null ? '$nome (${moeda.codigo})' : moeda.codigo;

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes da Moeda')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.monetization_on, size: 80, color: cor),
            const SizedBox(height: 24),
            Text(
              titulo,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            Text('Cotação atual:',
                style: TextStyle(fontSize: 16, color: cor)),
            const SizedBox(height: 8),
            Text(
              moeda.valor.toStringAsFixed(2),
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Text('Data da cotação: ${moeda.data}',
                style: const TextStyle(fontSize: 16, color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}
