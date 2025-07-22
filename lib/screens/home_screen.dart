import 'package:flutter/material.dart';

/// Tela inicial com mensagem de boas-vindas.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App de Cotações'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ícone decorativo
              const Icon(
                Icons.currency_exchange_rounded,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 24),
              // Título principal
              const Text(
                'Bem-vindo ao App de Cotações da BSF!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              // Subtítulo descritivo
              Text(
                'Aqui você acompanha as cotações das principais moedas em tempo real, com dados confiáveis e atualizados.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
