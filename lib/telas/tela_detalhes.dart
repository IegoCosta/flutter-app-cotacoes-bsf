import 'package:flutter/material.dart';

/// Tela que exibe detalhes de uma moeda selecionada.
class TelaDetalhes extends StatelessWidget {
  final String codigo;
  final String? nomeCompleto;
  final double valor;
  final String data;

  const TelaDetalhes({
    super.key,
    required this.codigo,
    this.nomeCompleto,
    required this.valor,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final titulo = nomeCompleto != null ? '$nomeCompleto ($codigo)' : codigo;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Moeda'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.monetization_on, size: 80, color: Colors.blue.shade700),
            const SizedBox(height: 16),
            Text(
              titulo,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            const Text('Cotacao atual:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text(
              valor.toStringAsFixed(2),
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Text('Data da cotacao: $data', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
