// ignore_for_file: library_private_types_in_public_api, deprecated_member_use, use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../theme.dart';
import '../widgets/bottom_button.dart';
import '../widgets/date_picker.dart';
import '../widgets/dropdown.dart';
import 'package:uuid/uuid.dart';

class PickupPage extends StatefulWidget {
  const PickupPage({super.key});

  @override
  _PickupPageState createState() => _PickupPageState();
}

class _PickupPageState extends State<PickupPage> {
  String? selectedTimeSlot;
  String? selectedWasteType;
  TextEditingController locationController = TextEditingController();
  DateTime? selectedDate;

  // Mengajukan Pickup ke Firestore
  Future<void> submitPickupRequest() async {
    if (locationController.text.isEmpty ||
        selectedDate == null ||
        selectedTimeSlot == null ||
        selectedWasteType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Harap isi semua field')),
      );
      return;
    }

    try {
      // Ambil UID dari pengguna yang sedang login
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Pengguna belum login')),
        );
        return;
      }
      String userId = user.uid;

      DateTime now = DateTime.now();
      String dateStr =
          "${now.day.toString().padLeft(2, '0')}${now.month.toString().padLeft(2, '0')}${now.year}";

      String wasteInitial;
      switch (selectedWasteType) {
        case 'Sampah Kertas':
          wasteInitial = 'SK';
          break;
        case 'Sampah Botol & Kaca':
          wasteInitial = 'SBK';
          break;
        case 'Sampah Plastik':
          wasteInitial = 'SP';
          break;
        case 'Sampah Logam':
          wasteInitial = 'SL';
          break;
        default:
          wasteInitial = '';
      }

      String timeSlotInitial;
      switch (selectedTimeSlot) {
        case 'Pagi (07.00 - 08.00)':
          timeSlotInitial = 'PI';
          break;
        case 'Siang (12.00 - 13.00)':
          timeSlotInitial = 'SG';
          break;
        case 'Sore (16.00 - 17.00)':
          timeSlotInitial = 'SE';
          break;
        case 'Malam (19.00 - 20.00)':
          timeSlotInitial = 'MM';
          break;
        default:
          timeSlotInitial = '';
      }

      var uuid = Uuid();
      String uniqueId = uuid.v4();

      String orderId = '$dateStr-$wasteInitial-$timeSlotInitial-$uniqueId';

      await FirebaseFirestore.instance.collection('ajukan_pickup').add({
        'lokasi_pickup': locationController.text,
        'tanggal_pickup': selectedDate,
        'waktu_pickup': selectedTimeSlot,
        'jenis_sampah': selectedWasteType,
        'createdAt': now,
        'order_id': orderId,
        'user_id': userId,
        'isRevised': false,
        'status': 'pending',
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Pickup berhasil diajukan dengan Order ID $orderId')),
      );

      locationController.clear();
      setState(() {
        selectedDate = null;
        selectedTimeSlot = null;
        selectedWasteType = null;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan saat submit pickup')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          centerTitle: true,
          surfaceTintColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: black),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ajukan Pickup',
                  style: bold20.copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(width: 24),
              ],
            ),
          ),
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/banner.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      const SizedBox(height: 12.0),

                      // Lokasi Pickup
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Lokasi Pickup', style: bold16),
                            const SizedBox(height: 8),
                            TextField(
                              controller: locationController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      BorderSide(color: grey3, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      BorderSide(color: grey3, width: 2),
                                ),
                                hintText: 'Masukkan alamat disini..',
                                filled: true,
                                fillColor: white,
                                hintStyle: regular14,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Tanggal Pickup
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Tanggal Pickup', style: bold16),
                            const SizedBox(height: 8),
                            DatePickerWidget(
                              decoration: InputDecoration(hintStyle: regular14),
                              onDateSelected: (DateTime date) {
                                setState(() {
                                  selectedDate = date;
                                });
                              },
                            ),
                          ],
                        ),
                      ),

                      // Waktu Pickup Dropdown
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomDropdown(
                              title: 'Waktu Pickup',
                              items: const [
                                'Pagi (07.00 - 08.00)',
                                'Siang (12.00 - 13.00)',
                                'Sore (16.00 - 17.00)',
                                'Malam (19.00 - 20.00)'
                              ],
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedTimeSlot = newValue;
                                });
                              },
                            ),
                          ],
                        ),
                      ),

                      // Jenis Sampah Dropdown
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomDropdown(
                              title: 'Jenis Sampah',
                              items: const [
                                'Sampah Kertas',
                                'Sampah Botol & Kaca',
                                'Sampah Plastik',
                                'Sampah Logam'
                              ],
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedWasteType = newValue;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Button Ajukan Pickup
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                color: Colors.white,
                child: BottomButton(
                  text: 'Ajukan Pickup',
                  color: Color(0xFFCCE400),
                  onPressed: submitPickupRequest,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
