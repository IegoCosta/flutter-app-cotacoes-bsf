# 📱 App de Cotações – BSF

Aplicativo Flutter desenvolvido como parte do desafio técnico do **Talent Lab 2025** da BSF.  
Seu objetivo é permitir a consulta de **cotações financeiras** (ex: USD, EUR, BRL) em tempo real, utilizando uma **API pública**.

---

## ✅ Funcionalidades (até o Dia 2)

- Tela inicial com **boas-vindas e tema institucional (azul e branco)**.
- Consumo da **API ExchangeRate-API** para buscar cotações.
- Exibição das moedas em uma **lista dinâmica (`ListView`)**.
- Código bem estruturado e separado em arquivos por responsabilidade.
- Botão de atualizar cotacões

---

## 🚀 Tecnologias utilizadas

- Flutter + Dart
- Material Design 3
- Pacote `http` para consumo de API
- Organização em pastas: `modelos`, `servicos`, `telas`

---

## 🌐 API utilizada

- [ExchangeRate API (gratuita)](https://www.exchangerate-api.com/)
- Endpoint usado:  
  `https://api.exchangerate-api.com/v4/latest/USD`

---

## 🛠️ Como rodar o projeto

```bash
# Clone o repositório
git clone https://github.com/seu-usuario/flutter-app-cotacoes-bsf.git

# Acesse a pasta do projeto
cd flutter-app-cotacoes-bsf

# Instale as dependências
flutter pub get

# Execute o aplicativo
flutter run
