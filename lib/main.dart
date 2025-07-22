import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

/// Função principal que inicia o aplicativo.
void main() {
  runApp(const AppCotacoes());
}

/// Widget raiz da aplicação com tema e tela inicial.
class AppCotacoes extends StatelessWidget {
  const AppCotacoes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BSF - Cotações Financeiras',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Tema azul e branco institucional
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
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 18, color: Colors.black87),
        ),
        fontFamily: 'Roboto',
        useMaterial3: true, // Interface mais moderna
      ),
      home: const HomeScreen(),
    );
  }
}
