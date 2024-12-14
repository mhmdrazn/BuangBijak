import "package:flutter/material.dart";
import '../theme.dart';
import '../widgets/button.dart';
import '../widgets/pickup_status.dart';

class DetailPickup extends StatelessWidget {
  const DetailPickup({
    super.key,
    required this.status,
    required this.time,
    required this.date,
    required this.wasteType,
    required this.address,
  });

  final String status;
  final String time;
  final String date;
  final String wasteType;
  final String address;

  @override
  Widget build(BuildContext context) {
    String message;

    if (status == 'success') {
      message = 'Sampahmu telah dipickup!';
    } else if (status == 'cancel') {
      message = 'Pickup telah dibatalkan';
    } else {
      message = 'Kolektor sedang dalam perjalanan!';
    }

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
            'Detail Pickup',
            style: bold20.copyWith(color: black),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: ListView(
        children: [
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
                  padding: const EdgeInsets.all(20.0),
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
                            '$date, $time',
                            style: bold16,
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            wasteType,
                            style: regular14,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        address,
                        style: regular14,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 20.0),
                      PickupStatus(status: status),
                      const SizedBox(height: 20.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            message,
                            style: bold16,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset('assets/images/maps.png',
                                  height: 200, fit: BoxFit.cover),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      if (status != 'success' && status != 'cancel')
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      builder: (context) => DetailPickup(
                                        status: 'pending',
                                        time: time,
                                        date: date,
                                        wasteType: wasteType,
                                        address: address,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: Button(
                                text: 'Batalkan Pickup',
                                color: red,
                                textColor: white,
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailPickup(
                                        status: 'cancel',
                                        time: time,
                                        date: date,
                                        wasteType: wasteType,
                                        address: address,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
