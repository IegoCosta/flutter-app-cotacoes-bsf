import 'package:flutter/material.dart';
import 'telas/tela_boas_vindas.dart';

void main() {
  runApp(const AppCotacoes());
}

class AppCotacoes extends StatelessWidget {
  const AppCotacoes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FX - Cotações Financeiras',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF6F00), // Laranja Inter
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF121212),
          elevation: 2,
          centerTitle: true,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
        fontFamily: 'Roboto',
      ),
      home: const TelaBoasVindas(),
    );
  }
}
