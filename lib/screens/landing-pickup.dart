import "package:flutter/material.dart";
import 'package:fp_tekber/screens/detail-pickup.dart';
import '../theme.dart';
import '../widgets/button.dart';

class LandingPickup extends StatelessWidget {
  const LandingPickup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: white,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: black),
            onPressed: () {
              Navigator.pop(context); // Goes back to the previous screen
            },
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BijakAngkut',
                  style: bold20.copyWith(color: black),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(width: 24)
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: 
            ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: 
                Column(
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


                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/icons/calendar.png',
                              fit: BoxFit.cover,
                              width: 20, // Set the width to 20px
                              height: 20, // Set the height to 20px
                            ),
                            const SizedBox(width: 12),
                            Text('Jadwal Pickup Anda', style: bold20),
                          ],
                        ),
                      ),

                      
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
                        child: 
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hari ini - Pukul 10.00 WIB', style: bold16,
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Text('8 Juni 2024', style: regular14),
                                        const SizedBox(width: 12),
                                        Text('Sampah Kertas, Botol, dan Plastik ', style: regular14),
                                      ],
                                    ), 
                                    const SizedBox(height: 20),
                                    Text('Jl. Sutorejo Tengah No.10, Dukuh Sutorejo, Kec. Mulyorejo, Surabaya, Jawa Timur 60113', style: regular16),

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
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        )
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icons/clock.png',
                                  fit: BoxFit.cover,
                                  width: 20, // Set the width to 20px
                                  height: 20, // Set the height to 20px
                                ),
                                const SizedBox(width: 12),
                                Text('Histori Pickup', style: bold20),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                // Your onPressed functionality here
                              },
                              child: Text('Lihat lainnya', style: regular14),
                            ),

                          ],
                        ),
                      ),

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
                        child: 
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '10 Juni 2024 - Pukul 12.00 WIB', style: bold16,
                                        ),

                                        Container(
                                          decoration: BoxDecoration(
                                              color: green, // Set the background color to green
                                              borderRadius: BorderRadius.circular(99), // Optional: Add rounded corners
                                            ),
                                            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 24), // Adjust padding inside the background if needed
                                            child: Text('Selesai', style: bold12.copyWith(color: black)), // Change text color to white for better contrast
                                        )

                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Text('Sampah Kertas, Botol, dan Plastik ', style: regular14)
                                      ],
                                    ), 
                                    const SizedBox(height: 20),
                                    Text('Jl. Sutorejo Tengah No.10, Dukuh Sutorejo, Kec. Mulyorejo, Surabaya, Jawa Timur 60113', style: regular16),                                  ],
                                ),
                              ),
                              
                            ],
                          )
                        )
                      ),

                      Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
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
                        child: 
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '8 Juni 2024 - Pukul 16.00 WIB', style: bold16,
                                        ),

                                        Container(
                                          decoration: BoxDecoration(
                                              color: red, // Set the background color to green
                                              borderRadius: BorderRadius.circular(99), // Optional: Add rounded corners
                                            ),
                                            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 24), // Adjust padding inside the background if needed
                                            child: Text('Dibatalkan', style: bold12.copyWith(color: black)), // Change text color to white for better contrast
                                        )

                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Text('Sampah Kertas, Botol, dan Plastik ', style: regular14)
                                      ],
                                    ), 
                                    const SizedBox(height: 20),
                                    Text('Jl. Sutorejo Tengah No.10, Dukuh Sutorejo, Kec. Mulyorejo, Surabaya, Jawa Timur 60113', style: regular16),                                  ],
                                ),
                              ),

                              const SizedBox(height: 20)
                              
                            ],
                          )
                        )
                      ),
                  ],
                )
              ) 
            )
    );
  }
}