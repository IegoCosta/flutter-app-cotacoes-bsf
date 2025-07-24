import 'package:flutter/material.dart';
import 'tela_principal.dart';

/// Tela de boas-vindas com navegação para a tela principal.
class TelaBoasVindas extends StatelessWidget {
  const TelaBoasVindas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-vindo'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.currency_exchange_rounded, size: 80, color: Colors.blue),
              const SizedBox(height: 24),
              const Text(
                'Bem-vindo ao App de Cotações da BSF!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
              const SizedBox(height: 12),
              Text(
                'Veja as cotações atualizadas de mais de 150 moedas do mundo todo.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const TelaPrincipal()),
                  );
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Consultar cotações'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
