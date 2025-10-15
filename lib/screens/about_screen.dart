// lib/screens/about_screen.dart
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de bibliotecas usadas no projeto
    final libraries = {
      'provider': 'Para um gerenciamento de estado simples e eficiente.',
      'google_mobile_ads': 'Para monetização com anúncios do AdMob.',
      'shared_preferences': 'Para persistência de dados no dispositivo.',
      'uuid': 'Para gerar identificadores únicos para cada tarefa.',
      'intl': 'Para internacionalização e localização (multi-idioma).',
    };

    return Scaffold(
      appBar: AppBar(title: const Text('Sobre o App')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  // Use Image.asset para carregar a imagem do seu projeto
                  backgroundImage: AssetImage('assets/images/eu.jpg'),
                  backgroundColor: Theme.of(
                    context,
                  ).primaryColor, // Cor de fundo se a imagem não carregar ou para preencher
                ),
                const SizedBox(height: 16),
                Text(
                  'Eder Gross Cichelero',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Text('Desenvolvedor do Aplicativo'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 16),
          Text(
            'Bibliotecas Utilizadas',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          ...libraries.entries.map((entry) {
            return Card(
              child: ListTile(
                leading: const Icon(Icons.extension_outlined),
                title: Text(entry.key),
                subtitle: Text(entry.value),
              ),
            );
          }),
        ],
      ),
    );
  }
}
