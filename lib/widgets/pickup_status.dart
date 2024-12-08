import 'package:flutter/material.dart';
import '../theme.dart';

class PickupStatus extends StatelessWidget {
  final String status;

  const PickupStatus({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Status',
        style: bold16,
      ),
      const SizedBox(height: 8.0),
      Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 32.0,
        ),
        decoration: BoxDecoration(
          color: status == 'Dibatalkan' ? red : status == 'Ditugaskan' ? white : green,
          border: status == 'Ditugaskan' ? Border.all(color: grey3, width: 2) : null,
          borderRadius: BorderRadius.circular(99.0),
        ),
        child: Text(
          'Ditugaskan',
          style: bold14.copyWith(color: status == 'Dibatalkan' ? Colors.white : black),
        ),
      ),
    ],
  );
  }
}
