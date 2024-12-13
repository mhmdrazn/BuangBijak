// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/bottom_button.dart';
import '../widgets/date_picker.dart';
import '../widgets/dropdown.dart';

class PickupPage extends StatefulWidget {
  const PickupPage({super.key});

  @override
  _PickupPageState createState() => _PickupPageState();
}

class _PickupPageState extends State<PickupPage> {
  String? selectedTimeSlot;
  String? selectedWasteType;

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
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      BorderSide(color: grey3, width: 2),
                                ),
                                filled: true,
                                fillColor: white,
                                hintText: 'Masukkan alamat disini..',
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
                              onDateSelected: (DateTime selectedDate) {
                                setState(() {});
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
                child: const BottomButton(
                  text: 'Ajukan Pickup',
                  color: Color(0xFFCCE400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
