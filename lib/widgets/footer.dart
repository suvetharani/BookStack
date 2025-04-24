import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookStackFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 24,
        vertical: isMobile ? 16 : 20,
      ),
      color: const Color(0xFFFFECDB),
      child: isMobile
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Social Media
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Follow us on:',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 12),
                    _socialIcon(
                      'https://cdn-icons-png.flaticon.com/512/733/733585.png',
                      'https://www.whatsapp.com/',
                    ),
                    _socialIcon(
                      'https://cdn-icons-png.flaticon.com/512/733/733547.png',
                      'https://www.facebook.com/',
                    ),
                    _socialIcon(
                      'https://cdn-icons-png.flaticon.com/512/2111/2111463.png',
                      'https://www.instagram.com/',
                    ),
                    _socialIcon(
                      'https://cdn-icons-png.flaticon.com/512/1384/1384060.png',
                      'https://www.youtube.com/',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Copyright
                const Text(
                  '© 2025 BookStack. All rights reserved.',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 16),
                // Payment options
                Column(
                  children: [
                    const Text(
                      'We accept secure payment:',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _assetPaymentIcon('assets/images/gpay.png', 'https://pay.google.com/'),
                        _assetPaymentIcon('assets/images/phonepe.png', 'https://www.phonepe.com/'),
                        _assetPaymentIcon('assets/images/creditcard.png', 'https://en.wikipedia.org/wiki/Credit_card'),
                      ],
                    ),
                  ],
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left: Social Media
                Row(
                  children: [
                    const Text(
                      'Follow us on:',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 12),
                    _socialIcon(
                      'https://cdn-icons-png.flaticon.com/512/733/733585.png',
                      'https://www.whatsapp.com/',
                    ),
                    _socialIcon(
                      'https://cdn-icons-png.flaticon.com/512/733/733547.png',
                      'https://www.facebook.com/',
                    ),
                    _socialIcon(
                      'https://cdn-icons-png.flaticon.com/512/2111/2111463.png',
                      'https://www.instagram.com/',
                    ),
                    _socialIcon(
                      'https://cdn-icons-png.flaticon.com/512/1384/1384060.png',
                      'https://www.youtube.com/',
                    ),
                  ],
                ),

                // Center: Copyright
                const Text(
                  '© 2025 BookStack. All rights reserved.',
                  style: TextStyle(fontSize: 14),
                ),

                // Right: Payment options
                Row(
                  children: [
                    const Text(
                      'We accept secure payment:',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 12),
                    _assetPaymentIcon('assets/images/gpay.png', 'https://pay.google.com/'),
                    _assetPaymentIcon('assets/images/phonepe.png', 'https://www.phonepe.com/'),
                    _assetPaymentIcon('assets/images/creditcard.png', 'https://en.wikipedia.org/wiki/Credit_card'),
                  ],
                ),
              ],
            ),
    );
  }

  /// Launches URL when called
  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  /// Widget for network icons with launchable links
  Widget _socialIcon(String iconUrl, String link) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: InkWell(
        onTap: () => _launchUrl(link),
        child: Image.network(iconUrl, width: 24, height: 24),
      ),
    );
  }

  /// Widget for local asset icons with launchable links
  Widget _assetPaymentIcon(String assetPath, String link) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: InkWell(
        onTap: () => _launchUrl(link),
        child: Image.asset(assetPath, width: 32, height: 24),
      ),
    );
  }
}
