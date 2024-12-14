import 'package:buang_bijak/utils/date_helper.dart';
import 'package:flutter/material.dart';
import 'package:buang_bijak/widgets/history_card.dart';
import '../theme.dart';
import 'package:logger/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final Logger logger = Logger();

class HistoryPickup extends StatelessWidget {
  const HistoryPickup({super.key});

  Future<List<Map<String, dynamic>>> _getUserPickups(String status) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return [];

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('ajukan_pickup')
          .where('user_id', isEqualTo: user.uid)
          .where('status', isEqualTo: status)
          .orderBy('tanggal_pickup')
          .get();

      return querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      logger.e('Error fetching pickups', error: e);
      return [];
    }
  }

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
          Container(
              decoration: BoxDecoration(
                color: green,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    spreadRadius: 0,
                    blurRadius: 20,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/truck-banner.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          const SizedBox(height: 24),
          Row(
            children: [
              Image.asset('assets/icons/clock.png', width: 20, height: 20),
              const SizedBox(width: 12),
              Text('Histori Pickup', style: bold16),
            ],
          ),
          const SizedBox(height: 16),
          FutureBuilder<List<Map<String, dynamic>>>(
            future: _getUserPickups('success'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text('Error fetching History');
              }

              List pickups = snapshot.data ?? [];

              if (pickups.isEmpty) {
                return Container(
                  width: double.infinity,
                  height: 80,
                  alignment: Alignment.center,
                  child: Text('Data kosong', textAlign: TextAlign.center),
                );
              }

              return Column(
                children: pickups.map((pickup) {
                  return Column(
                    children: [
                      HistoryCard(
                        time: pickup['waktu_pickup'],
                        date:
                            formatPickupDate(pickup['tanggal_pickup'].toDate()),
                        wasteType: pickup['jenis_sampah'],
                        address: pickup['lokasi_pickup'],
                        status: pickup['status'],
                        orderId: pickup['order_id'],
                      ),
                      const SizedBox(height: 8),
                    ],
                  );
                }).toList(),
              );
            },
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
