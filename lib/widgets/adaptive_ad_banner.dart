// lib/widgets/adaptive_ad_banner.dart
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';

class AdaptiveAdBannerWidget extends StatefulWidget {
  const AdaptiveAdBannerWidget({super.key});

  @override
  State<AdaptiveAdBannerWidget> createState() => _AdaptiveAdBannerWidgetState();
}

class _AdaptiveAdBannerWidgetState extends State<AdaptiveAdBannerWidget> {
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;

  // IDs de teste do AdMob. Lembre-se de trocá-los pelos seus IDs reais em produção.
  final adUnitId = Platform.isAndroid
      ? 'ca-app-pub-4241608895500197/6122869496'
      : 'ca-app-pub-4241608895500197/9108125480';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadAd();
  }

  Future<void> _loadAd() async {
    // Se um anúncio já está carregado, não faz nada.
    if (_isAdLoaded) {
      return;
    }

    // Pega a largura da tela atual.
    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
          MediaQuery.of(context).size.width.truncate(),
        );

    if (size == null) {
      // Se não conseguir obter o tamanho, não carrega o anúncio.
      return;
    }

    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: size,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isAdLoaded && _bannerAd != null) {
      return SizedBox(
        width: _bannerAd!.size.width.toDouble(),
        height: _bannerAd!.size.height.toDouble(),
        child: AdWidget(ad: _bannerAd!),
      );
    }
    // Se o anúncio não carregou, retorna um container vazio.
    return const SizedBox.shrink();
  }
}
