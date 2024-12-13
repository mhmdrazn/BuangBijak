import 'package:flutter/material.dart';
import 'package:buang_bijak/widgets/history_card.dart';
import '../theme.dart';
// Import HomeScreen
// Import DetailPickup

class HistoryPickup extends StatelessWidget {
  const HistoryPickup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: black),
          onPressed: () {
            Navigator.pop(context); // Goes back to the previous screen
          },
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Text(
            'History Pickup',
            style: bold20.copyWith(color: black),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20.0, 6, 20.0, 6),
        children: [
          HistoryCard(
            date: '10 Juni 2024',
            time: '10.00 WIB',
            status: 'Selesai',
            wasteType: 'Sampah Botol dan Kaca', // Warna hijau untuk Selesai
            address:
                'Jl. Sutorejo Tengah No.10, Dukuh Sutorejo, Kec. Mulyorejo, Surabaya, Jawa Timur 60113',
          ),
          HistoryCard(
            date: '1 Juni 2024',
            time: '13.00 WIB',
            status: 'Selesai',
            wasteType: 'Sampah Botol dan Kaca', // Warna hijau untuk Selesai
            address:
                'Jl. Sutorejo Tengah No.10, Dukuh Sutorejo, Kec. Mulyorejo, Surabaya, Jawa Timur 60113',
          ),
          HistoryCard(
            date: '10 Mei 2024',
            time: '10.00 WIB',
            status: 'Dibatalkan',
            wasteType: 'Sampah Botol dan Kaca', // Warna merah untuk Dibatalkan
            address:
                'Jl. Kertajaya Indah II No.F 501, Manyar Sabrangan, Kec. Mulyorejo, Surabaya, Jawa Timur 60116',
          ),
        ],
      ),
    );
  }

  // Widget _buildPickupCard(
  //   BuildContext context, {
  //   required String date,
  //   required String time,
  //   required String status,
  //   required Color statusColor,
  //   required String address,
  // }) {
  //   return Card(
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
  //     elevation: 4,
  //     margin: const EdgeInsets.only(bottom: 16.0),
  //     color: Colors.white,
  //     child: Stack(
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.all(16.0),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Row(
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   // Menggunakan ikon dari assets
  //                   Image.asset(
  //                     'assets/icons/calendar.png',
  //                     width: 20, // Ukuran lebar ikon
  //                     height: 20, // Ukuran tinggi ikon
  //                   ),
  //                   const SizedBox(width: 8),
  //                   Text(
  //                     '$date - Pukul $time',
  //                     style: const TextStyle(
  //                       fontSize: 16,
  //                       fontWeight: FontWeight.bold,
  //                       fontFamily: 'PlusJakartaSans',
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               const SizedBox(height: 4),
  //               const Text(
  //                 'Sampah Kertas, Botol, dan Plastik',
  //                 style: TextStyle(
  //                   fontSize: 14,
  //                   color: Colors.black,
  //                   fontFamily: 'PlusJakartaSans',
  //                 ),
  //               ),
  //               const SizedBox(height: 16),
  //               Text(
  //                 address,
  //                 style: const TextStyle(
  //                   fontSize: 14,
  //                   color: Colors.black,
  //                   fontFamily: 'PlusJakartaSans',
  //                 ),
  //               ),
  //               const SizedBox(height: 16),
  //               Align(
  //                 alignment: Alignment.bottomRight,
  //                 child: ElevatedButton(
  //                   onPressed: () {
  //                     // Navigasi ke halaman DetailPickup dengan menggunakan Navigator.pushNamed
  //                     Navigator.pushNamed(
  //                       context,
  //                       '/detail-pickup',
  //                       arguments: {
  //                         'date': date,
  //                         'time': time,
  //                         'status': status,
  //                         'address': address,
  //                       },
  //                     );
  //                   },
  //                   style: ElevatedButton.styleFrom(
  //                     backgroundColor:
  //                         Colors.lime, // Warna tombol sesuai gambar
  //                     foregroundColor: Colors.black, // Teks tombol hitam
  //                     shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(8.0),
  //                     ),
  //                   ),
  //                   child: const Text(
  //                     'Selengkapnya',
  //                     style: TextStyle(fontFamily: 'PlusJakartaSans'),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         Positioned(
  //           top: 8,
  //           right: 8, // Posisikan label lebih dekat ke pojok kanan atas
  //           child: Container(
  //             padding: const EdgeInsets.symmetric(
  //                 horizontal: 16, vertical: 8), // Perpanjang padding
  //             decoration: BoxDecoration(
  //               color: statusColor, // Warna hijau atau merah
  //               borderRadius: BorderRadius.circular(
  //                   16.0), // Menambahkan border radius agar lebih rounded
  //             ),
  //             child: Text(
  //               status,
  //               style: const TextStyle(
  //                 color: Colors.white, // Font status putih
  //                 fontSize: 14, // Ukuran font yang lebih kecil
  //                 fontWeight: FontWeight.bold,
  //                 fontFamily: 'PlusJakartaSans',
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
