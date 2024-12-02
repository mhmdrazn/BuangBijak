import "package:flutter/material.dart";
import '../theme.dart';
import '../widgets/button.dart';

class DetailPickup extends StatelessWidget {
  const DetailPickup({super.key});

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
                  'Detail Pickup',
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
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
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
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/truck-banner.png',
                        fit: BoxFit.cover,
                        width: double.infinity, 
                      ),
                      
                      const SizedBox(height: 20.0),
                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '10 Juni 2024 - Pukul 10.00 WIB',
                            style: bold16,
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            'Sampah Kertas, Botol, dan Plastik ',
                            style: regular12,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),

                      const SizedBox(height: 20.0),

                      Text(
                        'Jl. Sutorejo Tengah No.10, Dukuh Sutorejo, Kec. Mulyorejo, Surabaya, Jawa Timur 60113',
                        style: regular16,
                        textAlign: TextAlign.left,
                      ),

                      const SizedBox(height: 20.0),

                      Text(
                        'Status',
                        style: bold16,
                        textAlign: TextAlign.left,
                      ),
                      
                      const SizedBox(height: 12.0),
                      
                      Container(
                        padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                        decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.circular(99.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ditugaskan',
                              style: bold14,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 20.0),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kolektor sedang dalam perjalanan!',
                            style: bold16
                          ), 
                          Image.asset('assets/images/maps.png', height: 200),
                        ],
                      ),

                      const SizedBox(height: 8.0),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(child: 
                            Button(
                              text: 'Reschedule', 
                              color: white, 
                              borderColor: grey3, 
                              textColor: black, 
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const DetailPickup(),
                                  ),
                                );
                            },),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(child:
                            Button(
                              text: 'Batalkan Pickup', 
                              color: red, 
                              textColor: white,
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const DetailPickup(),
                                  ),
                                );
                            },),
                          )
                          
                        ],
                      )

                    ],
                  ),
                ),
              ),
            )
          ),
        ) 
        
    );
  }
}