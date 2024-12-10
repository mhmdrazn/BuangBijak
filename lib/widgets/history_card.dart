import 'package:flutter/material.dart';
import '../theme.dart';

class HistoryCard extends StatelessWidget {
  final String datetime;
  final String status;
  final String wasteType;
  final String address;


  const HistoryCard({
    super.key,
    required this.datetime,
    required this.status,
    required this.wasteType,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
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
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      datetime, style: bold16,
                    ),
          
                    Container(
                      decoration: BoxDecoration(
                          color: status == 'Selesai' ? green : status == 'Ditugaskan' ? grey3 : red,
                          borderRadius: BorderRadius.circular(99),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 24), 
                        child: Text(status, style: bold12.copyWith(color: black)),
                    )
          
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(wasteType, style: regular14)
                  ],
                ), 
                const SizedBox(height: 20),
                Text(address, style: regular16),
              ],
            ),
        ),
        )
      );
  }
}
