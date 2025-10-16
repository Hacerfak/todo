// lib/screens/about_screen.dart
import 'package:flutter/material.dart';
import '../widgets/adaptive_ad_banner.dart';
// Importa o arquivo de localização
import '../l10n/l10n.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Objeto de localização
    final local = S.of(context)!;

    // Mapa de bibliotecas, agora usando as chaves de localização para as descrições
    final libraries = {
      'provider': local.providerDescription,
      'google_mobile_ads': local.googleAdsDescription,
      'shared_preferences': local.sharedPrefsDescription,
      'uuid': local.uuidDescription,
      'intl': local.intlDescription,
    };

    return Scaffold(
      appBar: AppBar(
        // #### ATUALIZADO ####
        title: Text(local.aboutAppTitle),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/eu.jpg'),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Eder Gross Cichelero', // Seu nome pode permanecer fixo
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      // #### ATUALIZADO ####
                      Text(local.developerSubtitle),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Divider(),
                const SizedBox(height: 16),
                // #### ATUALIZADO ####
                Text(
                  local.librariesUsed,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                ...libraries.entries.map((entry) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.extension_outlined),
                      title: Text(
                        entry.key,
                      ), // Nomes dos pacotes não são traduzidos
                      subtitle: Text(entry.value), // Descrições são traduzidas
                    ),
                  );
                }),
              ],
            ),
          ),
          const SafeArea(child: AdaptiveAdBannerWidget()),
        ],
      ),
    );
  }
}
