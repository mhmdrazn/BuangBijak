// ignore_for_file: deprecated_member_use

import "package:flutter/material.dart";
import '../screens/dashboard_detail.dart';
import '../widgets/dashboard_card.dart';
import '../theme.dart';
import 'package:flutter/services.dart'; // Untuk SystemNavigator.pop()
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:buang_bijak/utils/date_helper.dart';

final Logger logger = Logger();

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  Future<List<Map<String, dynamic>>> fetchPickupData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return [];

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('ajukan_pickup')
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
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop(); // Keluar dari aplikasi
        return Future.value(true); // Mengizinkan aksi back
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: white,
          centerTitle: true,
          surfaceTintColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Text(
              'Jadwal Pickup',
              style: bold20.copyWith(color: black),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: Stack(
          children: [ 
            FutureBuilder<List<Map<String, dynamic>>>(
              future: fetchPickupData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Terjadi kesalahan: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('Tidak ada data pickup.'));
                }

                List<Map<String, dynamic>> dashboardData = snapshot.data ?? [];
                return SingleChildScrollView(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: Column(
                        children: dashboardData.map((data) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                            child: 
                            DashboardCard(
                              iconPath: 'assets/icons/calendar.png',
                              date: formatPickupDate(
                                      data['tanggal_pickup'].toDate()),
                              details: data['jenis_sampah'],
                              address: data['lokasi_pickup'],
                              status: data['status'],
                              buttonText: 'Lihat Detail',
                              buttonAction: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DashboardDetail(
                                      status: data['status'],
                                      wasteType: data['jenis_sampah'],
                                      address: data['lokasi_pickup'],
                                      date: formatPickupDate(
                                        data['tanggal_pickup'].toDate()),
                                      time: data['waktu_pickup'],
                                      orderId: data['order_id'],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                );
              },
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
                    // BottomNavigationBarItem(
                    //     icon: Icon(Icons.inbox), label: 'Pickup'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: 'Profile'),
                  ],
                  onTap: (index) {
                    String routeName;
                    switch (index) {
                      case 0:
                        routeName = '/';
                        break;
                      // case 1:
                      //   routeName = '/ajukan-pickup';
                      //   break;
                      case 1:
                        routeName = '/profil-saya';
                        break;
                      default:
                        routeName = '/';
                    }
                    Navigator.pushReplacementNamed(context, routeName);
                  },
                ),
              ),
            ),
          ],
        ) 
      ),
    );
  }
}
