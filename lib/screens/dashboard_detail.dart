import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import '../theme.dart';
import '../widgets/button.dart';
import '../widgets/pickup_status.dart';

class DashboardDetail extends StatelessWidget {
  const DashboardDetail({
    super.key,
    required this.status,
    required this.time,
    required this.date,
    required this.wasteType,
    required this.address,
    required this.orderId,
  });

  final String status;
  final String time;
  final String date;
  final String wasteType;
  final String address;
  final String orderId;

  @override
  Widget build(BuildContext context) {
    String message;

    if (status == 'Success') {
      message = 'Sampah telah selesai dipickup!';
    } else if (status == 'Cancel') {
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
                        const SizedBox(height: 8.0),
                        Text(
                          wasteType,
                          style: regular14,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lokasi Pickup',
                          style: bold16,
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          address,
                          style: regular14,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    PickupStatus(status: status, isRevised: false),
                    const SizedBox(height: 20.0),

                    // Kolektor dan Peta
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
                            child: Image.asset('assets/images/maps.png', height: 200, fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                    
                    if (status == 'Pending' || status == 'pending')
                      Column(
                        children: [
                          const SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Button(
                                  text: 'Tolak Pickup',
                                  color: red,
                                  textColor: white,
                                  onPressed: () {
                                    _showRejectReasonDialog(context);
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
                                    _showAcceptDialog(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showRejectReasonDialog(BuildContext context) {
    final TextEditingController reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alasan Penolakan", style: bold16),
          backgroundColor: white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
                controller: reasonController,
                decoration: InputDecoration(
                  hintText: "Masukkan alasan penolakan",
                  hintStyle: regular14.copyWith(color: grey1),
                ),
              ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Batal", style: bold14.copyWith(color: black)),
            ),
            TextButton(
              onPressed: () {
                final String rejectReason = reasonController.text.trim();
                if (rejectReason.isNotEmpty) {
                  // Update Firestore
                  _rejectPickup(context, rejectReason);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Alasan penolakan tidak boleh kosong.", style: regular14.copyWith(color: black)),
                    ),
                  );
                }
              },
              child: Text("Konfirmasi", style: bold14.copyWith(color: black)),
            ),
          ],
        );
      },
    );
  }

  void _rejectPickup(BuildContext context, String rejectReason) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('ajukan_pickup')
          .where('order_id', isEqualTo: orderId)
          .get();

      if (querySnapshot.docs.isEmpty) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Data tidak ditemukan')),
        );
        return;
      }

      DocumentSnapshot document = querySnapshot.docs.first;
      await FirebaseFirestore.instance
          .collection('ajukan_pickup')
          .doc(document.id)
          .update({
        'status': 'Cancel',
        'rejectedReason': rejectReason,
      });

      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Pickup berhasil ditolak.", style: regular14.copyWith(color: white)),
          backgroundColor: red,
        ),
      );

      Navigator.pop(context);

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Gagal menolak pickup: ${e.toString()}"),
          backgroundColor: red,
        ),
      );
    }
  }

  void _showAcceptDialog(BuildContext context) {

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Selesaikan Pickup", style: bold16),
          backgroundColor: white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              "Apakah Anda yakin ingin menyelesaikan proses pickup? Pastikan semua barang telah diterima dan dicek dengan benar.",
              style: regular12,
              textAlign: TextAlign.start,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Batal", style: bold14.copyWith(color: black)),
            ),
            TextButton(
              onPressed: () {
                _acceptPickup(context);
              },
              child: Text("Konfirmasi", style: bold14.copyWith(color: black)),
            ),  
          ],
        );
      },
    );
  }

  void _acceptPickup(BuildContext context) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('ajukan_pickup')
          .where('order_id', isEqualTo: orderId)
          .get();

      if (querySnapshot.docs.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Data tidak ditemukan')),
        );
        return;
      }

      DocumentSnapshot document = querySnapshot.docs.first;
      await FirebaseFirestore.instance
          .collection('ajukan_pickup')
          .doc(document.id)
          .update({
        'status': 'Success',
      });

      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Pickup berhasil diselesaikan.", style: regular14.copyWith(color: black)),
          backgroundColor: green,
        ),
      );

      Navigator.pop(context);

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Gagal menerima pickup: ${e.toString()}"),
          backgroundColor: red,
        ),
      );
    }
  }
}
