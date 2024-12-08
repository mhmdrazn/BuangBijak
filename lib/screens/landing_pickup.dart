import 'package:flutter/material.dart';
import 'package:fp_tekber/screens/detail_pickup.dart';
import '../theme.dart';
import '../widgets/button.dart';
import '../widgets/history_card.dart';
import '../models/history_card.dart';

class LandingPickup extends StatelessWidget {
  final List<HistoryData> historyData = [
    HistoryData(
      datetime: '10 Juni 2024 - Pukul 12.00 WIB',
      wasteType: 'Sampah Kertas, Botol, dan Plastik',
      address:
          'Jl. Sutorejo Tengah No.10, Dukuh Sutorejo, Kec. Mulyorejo, Surabaya, Jawa Timur 60113',
      status: 'Selesai',
    ),
    HistoryData(
      datetime: '8 Juni 2024 - Pukul 16.00 WIB',
      wasteType: 'Sampah Kertas, Botol, dan Plastik',
      address:
          'Jl. Sutorejo Tengah No.10, Dukuh Sutorejo, Kec. Mulyorejo, Surabaya, Jawa Timur 60113',
      status: 'Dibatalkan',
    ),
  ];

  LandingPickup({super.key});

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
            'BijakAngkut',
            style: bold20.copyWith(color: black),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
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
                    child: 
                      Column(
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
                      )
                    )
                  ),
                // Pickup Schedule Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/calendar.png',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 12),
                      Text('Jadwal Pickup Anda', style: bold20),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 20,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hari ini - Pukul 10.00 WIB',
                            style: bold16,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text('8 Juni 2024', style: regular14),
                              const SizedBox(width: 12),
                              Text(
                                'Sampah Kertas, Botol, dan Plastik',
                                style: regular14,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Jl. Sutorejo Tengah No.10, Dukuh Sutorejo, Kec. Mulyorejo, Surabaya, Jawa Timur 60113',
                            style: regular16,
                          ),
                          const SizedBox(height: 20),
                          Button(
                            text: 'Selengkapnya',
                            color: green,
                            textColor: black,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DetailPickup(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // History Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/clock.png',
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 12),
                          Text('Histori Pickup', style: bold20),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          // Your "See More" functionality here
                        },
                        child: Text('Lihat lainnya', style: regular14),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // History Cards
                ...historyData.map((data) {
                  return HistoryCard(
                      datetime: data.datetime,
                      status: data.status,
                      wasteType: data.wasteType,
                      address: data.address,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
