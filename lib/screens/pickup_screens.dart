import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/bottom_button.dart';
import '../widgets/date_picker.dart';

class PickupPage extends StatefulWidget {
  @override
  _PickupPageState createState() => _PickupPageState();
}

class _PickupPageState extends State<PickupPage> {
  String? selectedTimeSlot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 24.0, left: 12.0, right: 12.0, bottom: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {} , 
                icon: Icon(Icons.chevron_left_rounded, color: Colors.black, size: 24)
              ),
              Text(
                'Ajukan Pickup',
                style: bold20, textAlign: TextAlign.center,
              ),
              const SizedBox(width: 24)
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/images/banner.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Lokasi Pickup', style: bold20),
                        SizedBox(height: 8),
                        TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: grey3, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: grey3, width: 2),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: grey3, width: 2),
                            ),
                            filled: true,
                            fillColor: grey3,
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                            hintText: 'Masukkan alamat disini..', hintStyle: regular14,
                            ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tanggal Pickup', style: bold20),
                        SizedBox(height: 8),
                        DatePickerTheme(data: data, child: child)
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Waktu Pickup', style: bold20),
                        DropdownButton<String>(
                          padding: EdgeInsets.only(left: 4, right: 4),
                          value: selectedTimeSlot, // The currently selected value
                          hint: Text('Pilih waktu pickup', style: regular14), // Placeholder text
                          isExpanded: true, // Makes the dropdown take up full width
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedTimeSlot = newValue; // Update selected time slot
                            });
                          },
                          style: TextStyle(color: grey1),
                          items: <String>['Pagi (7.00 - 8.00)', 'Siang (12.00 - 13.00)', 'Sore (16.00 - 17.00)']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, style: regular14),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Jenis Sampah', style: bold20),
                        DropdownButton<String>(
                          padding: EdgeInsets.only(left: 4, right: 4),
                          value: selectedTimeSlot, // The currently selected value
                          hint: Text('Pilih jenis sampah', style: regular14), // Placeholder text
                          isExpanded: true, // Makes the dropdown take up full width
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedTimeSlot = newValue; // Update selected time slot
                            });
                          },
                          style: TextStyle(color: grey1),
                          items: <String>['Sampah Kertas', 'Sampah Botol & Kaca', 'Sampah Plastik', 'Sampah Logam']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, style: regular14),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

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
    );
  }
}