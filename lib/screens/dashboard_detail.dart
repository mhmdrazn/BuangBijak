import "package:flutter/material.dart";
import '../theme.dart';
import '../widgets/button.dart';
import '../widgets/pickup_status.dart';

class DashboardDetail extends StatelessWidget {
  const DashboardDetail({super.key});

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
            Navigator.pop(context); // Kembali ke layar sebelumnya
          },
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Text(
            'Dashboard Detail',
            style: bold20.copyWith(color: black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Gambar Banner
                    Image.asset(
                      'assets/images/truck-banner.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    const SizedBox(height: 20.0),

                    // Informasi Pickup
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '10 Juni 2024 - Pukul 10.00 WIB',
                          style: bold16,
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          'Sampah Kertas, Botol, dan Plastik',
                          style: regular12,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),

                    // Alamat Pickup
                    Text(
                      'Jl. Sutorejo Tengah No.10, Dukuh Sutorejo, Kec. Mulyorejo, Surabaya, Jawa Timur 60113',
                      style: regular16,
                    ),
                    const SizedBox(height: 20.0),

                    // Status Pickup
                    const PickupStatus(
                      status: 'Ditugaskan',
                      isRevised: false,
                    ),
                    const SizedBox(height: 20.0),

                    // Kolektor dan Peta
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kolektor sedang dalam perjalanan!',
                          style: bold16,
                        ),
                        const SizedBox(height: 12.0),
                        Image.asset(
                          'assets/images/maps.png',
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),

                    // Tombol Aksi
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Button(
                            text: 'Reschedule',
                            color: white,
                            borderColor: grey3,
                            textColor: black,
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DashboardDetail(),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Button(
                            text: 'Tandai Selesai',
                            color: green,
                            textColor: black,
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DashboardDetail(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),

                    // Tombol Batalkan Pickup
                    SizedBox(
                      width: double.infinity,
                      child: Button(
                        text: 'Batalkan Pickup',
                        color: red,
                        textColor: white,
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DashboardDetail(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
