import 'package:flutter/material.dart';
import 'telas/tela_boas_vindas.dart';

/// Função principal do aplicativo.
void main() {
  runApp(const AppCotacoes());
}

/// Widget raiz do app com tema institucional.
class AppCotacoes extends StatelessWidget {
  const AppCotacoes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BSF - Cotações Financeiras',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          elevation: 2,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const TelaBoasVindas(),
    );
  }
}
