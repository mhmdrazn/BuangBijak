import 'package:flutter/material.dart';
import 'package:buang_bijak/widgets/navigation_buttons.dart';
import '../widgets/home_app_bar.dart';
import '../screens/history_pickup.dart';
import '../widgets/jadwal_card.dart';
import 'package:logger/logger.dart';
import 'package:buang_bijak/theme.dart';
import 'package:buang_bijak/widgets/history_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final logger = Logger();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: HomeAppBar(),
      ),
      body: Stack(
        children: [
          // Konten Utama
          SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const NavigationButtons(), // Menambahkan tombol navigasi di sini
                const SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Jadwal Angkut Sampah Anda',
                      style: bold16,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HistoryPickup(),
                          ),
                        );
                      },
                      child: Text('Lihat lainnya',
                          style: regular12.copyWith(color: grey2)),
                    ),
                  ],
                ),
                
                const SizedBox(height: 16),
                
                const JadwalCard(
                  date: '13 Juni 2024',
                  time: 'Hari Ini - Pukul 10.00 WIB',
                  wasteType: 'Sampah Botol dan Kaca',
                  address:
                      'Jl. Sutorejo Tengah No.10, Dukuh Sutorejo, Kec. Mulyorejo, Surabaya, Jawa Timur 60113',
                  status: 'Ditugaskan',
                ),

                const SizedBox(height: 16),
                const ImageBanner(),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Histori Pickup',
                      style: bold16,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HistoryPickup(),
                          ),
                        );
                      },
                      child: Text('Lihat lainnya',
                          style: regular12.copyWith(color: grey2)),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                const HistoryCard(
                    time: 'Pukul 10.00 WIB',
                    status: 'Selesai',
                    date: '10 Juni 2024',
                    wasteType: 'Sampah Botol dan Kaca',
                    address:
                        'Jl. Sutorejo Tengah No.10, Dukuh Sutorejo, Kec. Mulyorejo, Surabaya, Jawa Timur 60113'
                ),
                
                const SizedBox(height: 80),
              ],
            ),
          ),
          // Floating Navigation Bar
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: BottomNavigationBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: 'Beranda'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.inbox), label: 'Pickup'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: 'Profile'),
                  ],
                  onTap: (index) {
                    String routeName;
                    switch (index) {
                      case 0:
                        routeName = '/';
                        break;
                      case 1:
                        routeName = '/ajukan-pickup';
                        break;
                      case 2:
                        routeName = '/profil-saya';
                        break;
                      default:
                        routeName = '/';
                    }
                    logger.d('Navigating to $routeName');

                    // Menggunakan pushReplacement agar tidak menumpuk stack duplicate
                    Navigator.pushReplacementNamed(context, routeName);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageBanner extends StatelessWidget {
  const ImageBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: green,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Teks dengan padding
          Expanded(
            flex: 2, // Proporsi lebih besar untuk teks
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Track dan Kelola\nSampah Mu!',
                    style: bold16,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Lacak Sampah dan Dukung\nLingkungan Lebih Bersih.',
                    style: regular14,
                  ),
                ],
              ),
            ),
          ),
          // Gambar tanpa padding
          Expanded(
            flex: 1, // Proporsi lebih kecil untuk gambar
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: Image.asset(
                'assets/images/girl_with_green_shirt.png',
                height: 180,
                fit: BoxFit.cover, // Gambar akan mengisi ruang dengan baik
              ),
            ),
          ),
        ],
      ),
    );
  }
}
