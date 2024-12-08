import "package:flutter/material.dart";
import '../theme.dart';
import '../widgets/button.dart';
import '../screens/dashboard_detail.dart';
import '../models/dashboard.dart';
import '../widgets/dashboard_card.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DashboardData> dashboardData = [
      DashboardData(
        date: 'Hari ini - Pukul 10.00 WIB',
        wasteType: '12 Juni 2024 - Sampah Kertas, Botol, dan Plastik',
        address: 'Jl. Sutorejo Tengah No.10, Dukuh Sutorejo, Kec. Mulyorejo, Surabaya, Jawa Timur 60113',
        status: 'Ditugaskan',
      ),
      DashboardData(
        date: 'Hari ini - Pukul 10.00 WIB',
        wasteType: '16 Juni 2024 - Sampah Kertas, Botol, dan Plastik',
        address: 'Jl. Sutorejo Tengah No.10, Dukuh Sutorejo, Kec. Mulyorejo, Surabaya, Jawa Timur 60113',
        status: 'Selesai',
      ),
      DashboardData(
        date: 'Hari ini - Pukul 10.00 WIB',
        wasteType: '8 Juni 2024 - Sampah Kertas, Botol, dan Plastik',
        address: 'Jl. Sutorejo Tengah No.10, Dukuh Sutorejo, Kec. Mulyorejo, Surabaya, Jawa Timur 60113',
        status: 'Dibatalkan',
      ),
    ];

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
        title: Text(
          'Dashboard',
          style: bold20.copyWith(color: black),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              children: dashboardData.map((data) => 
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: DashboardCard(
                    iconPath: 'assets/icons/calendar.png',
                    date: data.date,
                    details: data.wasteType,
                    address: data.address,
                    status: data.status,
                    buttonText: 'Lihat Detail',
                    buttonAction: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardDetail(),
                        ),
                      );
                    },
                  ),
                )
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}