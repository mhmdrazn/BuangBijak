import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250, // Tinggi cukup besar untuk konten
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF68ACB4),
            Color(0xFFCCE400),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Stack(
        children: [
          // Gambar maskot
          Positioned(
            right: 12,
            bottom: -20,
            child: Image.asset(
              'assets/images/hero_mascot.png',
              height: 200,
            ),
          ),
          // Konten header (teks dan search bar)
          Padding(
            padding:
                const EdgeInsets.fromLTRB(16, 48, 16, 16), // Sesuaikan padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize:
                  MainAxisSize.min, // Jangan paksa column ke tinggi penuh
              children: [
                const Text(
                  'Selamat Pagi\nAdrian!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Telusuri disini',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
