# 📱 App de Cotações – BSF

Aplicativo Flutter desenvolvido como parte do desafio técnico do **Talent Lab 2025** da BSF.  
Seu objetivo é permitir a consulta de **cotações financeiras** (ex: USD, EUR, BRL) em tempo real, utilizando uma **API pública**.

---

## 🚀 Funcionalidades

### ✅ Dia 1 — Tela de boas-vindas
- Interface com tema azul e branco institucional
- Tela inicial com ícone, título e botão de acesso às cotações

### ✅ Dia 2 — Listagem de moedas
- Consumo da [ExchangeRate API](https://www.exchangerate-api.com/)
- Exibição de **todas as moedas disponíveis** na API
- Nomes completos exibidos (Dólar Americano, Euro, etc.)
- Botão para atualizar as cotações

### ✅ Dia 3 — Tela de detalhes
- Navegação ao tocar em uma moeda
- Tela detalhada com:
  - Código da moeda
  - Nome completo
  - Valor em relação ao USD
  - Data da cotação

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
