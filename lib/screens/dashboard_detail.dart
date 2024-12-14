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
    required this.orderId, // Use orderId instead of pickupId
  });

  final String status;
  final String time;
  final String date;
  final String wasteType;
  final String address;
  final String orderId; // Firestore document ID for the order

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
                          'Alamat',
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
                                _updatePickupStatus(context, 'success');
                              },
                            ),
                          ),
                        ],
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

  void _showRejectReasonDialog(BuildContext context) {
    final TextEditingController reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Alasan Penolakan"),
          content: TextField(
            controller: reasonController,
            decoration: const InputDecoration(
              hintText: "Masukkan alasan penolakan",
            ),
            maxLines: 3,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
              },
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                final String rejectReason = reasonController.text.trim();
                if (rejectReason.isNotEmpty) {
                  _updatePickupStatus(context, 'cancel', rejectReason);
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Alasan penolakan tidak boleh kosong."),
                    ),
                  );
                }
              },
              child: const Text("Konfirmasi"),
            ),
          ],
        );
      },
    );
  }

  void _updatePickupStatus(
      BuildContext context, String status, [String? rejectReason]) async {
    try {
      // Cetak ID dokumen untuk verifikasi
      print('Attempting to update document ID: $orderId');

      // Periksa apakah dokumen ada sebelum update
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection('ajukan_pickup')
          .doc(orderId)
          .get();

      if (!docSnapshot.exists) {
        // Tampilkan pesan jika dokumen tidak ditemukan
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Dokumen dengan ID $orderId tidak ditemukan."),
          ),
        );
        return;
      }

      // Siapkan data update
      Map<String, dynamic> updateData = {
        'status': status,
      };

      // Tambahkan alasan penolakan jika ada
      if (rejectReason != null && rejectReason.isNotEmpty) {
        updateData['rejectedReason'] = rejectReason;
      }

      // Lakukan update
      await FirebaseFirestore.instance
          .collection('ajukan_pickup')
          .doc(orderId)
          .update(updateData);

      // Pastikan konteks masih valid sebelum menampilkan SnackBar
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(status == 'success'
                ? "Pickup ditandai sebagai selesai."
                : "Pickup ditolak."),
          ),
        );

        // Kembali ke layar sebelumnya
        Navigator.pop(context);
      }
    } catch (e) {
      print('Error updating Firestore: $e');
      
      // Pastikan konteks masih valid
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Gagal memperbarui status pickup: $e"),
          ),
        );
      }
    }
  }
}
