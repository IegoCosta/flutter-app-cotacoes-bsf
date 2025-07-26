import 'package:flutter/material.dart';
import 'tela_principal.dart';

class TelaBoasVindas extends StatelessWidget {
  const TelaBoasVindas({super.key});

  @override
  Widget build(BuildContext context) {
    final laranjaForte = const Color.fromARGB(255, 223, 120, 41);

    return Scaffold(
      body: Column(
        children: [
          // Faixa superior laranja com o título
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 25),
            color: laranjaForte,
            child: const Center(
              child: Text(
                'Bem-vindo ao seu APP de cotações',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Spacer(),

          // Logo central com bordas arredondadas
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/imagens/logo.png',
                height: 120,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Frase descritiva
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Acompanhe cotações de moedas globais com precisão e velocidade.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
          ),

          const SizedBox(height: 32),

          // Botão estilizado
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: FilledButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TelaPrincipal()),
                );
              },
              icon: const Icon(Icons.attach_money),
              label: const Text('Ver cotações'),
              style: FilledButton.styleFrom(
                backgroundColor: laranjaForte,
                minimumSize: const Size.fromHeight(48),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ),

          const Spacer(),

          // Rodapé com versão
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Column(
              children: [
                Text('Versão 1.0.0', style: TextStyle(color: Colors.white38)),
                SizedBox(height: 4),
                Text('© 2025 FX - Todos os direitos reservados',
                    style: TextStyle(color: Colors.white38, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
