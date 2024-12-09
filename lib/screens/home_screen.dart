import 'package:flutter/material.dart';
import 'package:fp_tekber/widgets/navigation_buttons.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_card.dart';
import '../widgets/history_list_item.dart';
import 'package:logger/logger.dart';

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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const NavigationButtons(), // Menambahkan tombol navigasi di sini
                const SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Jadwal Angkut Sampah Anda',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Lihat lainnya'),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                // const HomeCard(
                //   title: 'Hari ini - Pukul 10.00 WIB',
                //   subtitle: '8 Juni 2024\nSampah Kertas, Botol, dan Plastik',
                //   address:
                //       'Jl. Sutorejo Tengah No.10, Dukuh Sutorejo, Kec. Mulyorejo, Surabaya, Jawa Timur 60113',
                //   buttonText: 'Selengkapnya',
                // ),

                const HistoryListItem(
                  date: '10 Juni 2024 - Pukul 10.00 WIB',
                  details: 'Sampah Kertas, Botol, dan Plastik',
                  address:
                      'Jl. Sutorejo Tengah No.10, Dukuh Sutorejo, Kec. Mulyorejo, Surabaya, Jawa Timur 60113',
                  status: 'Selesai',
                  buttonText: 'Selengkapnya',
                ),
                const SizedBox(height: 16),
                const ImageBanner(),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Histori Pickup',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Lihat lainnya'),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const HistoryListItem(
                  date: '10 Juni 2024 - Pukul 10.00 WIB',
                  details: 'Sampah Kertas, Botol, dan Plastik',
                  address:
                      'Jl. Sutorejo Tengah No.10, Dukuh Sutorejo, Kec. Mulyorejo, Surabaya, Jawa Timur 60113',
                  status: 'Selesai',
                  buttonText: 'Selengkapnya',
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
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Teks dengan padding
          const Expanded(
            flex: 2, // Proporsi lebih besar untuk teks
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Track dan Kelola Sampah Mu!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Lacak Sampah dan Dukung Lingkungan Lebih Bersih.',
                    style: TextStyle(fontSize: 14),
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
