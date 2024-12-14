import 'package:flutter/material.dart';
import '../theme.dart';

class PickupStatus extends StatelessWidget {
  final String status;
  final bool isRevised;

  const PickupStatus({
    super.key,
    required this.status,
    required this.isRevised,
  });

  @override
  Widget build(BuildContext context) {
    Color getStatusColor() {
      switch (status) {
        case 'cancel':
          return red;
        case 'pending':
          return grey3;
        case 'success':
          return green;
        default:
          return grey3;
      }
    }

    Color getTextColor() {
      return status == 'Dibatalkan' ? Colors.white : black;
    }

    Border? getStatusBorder() {
      return status == 'Ditugaskan' ? Border.all(color: grey3, width: 2) : null;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Status',
          style: bold16,
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 24,
              ),
              decoration: BoxDecoration(
                color: getStatusColor(),
                border: getStatusBorder(),
                borderRadius: BorderRadius.circular(99.0),
              ),
              child: Text(
                status,
                style: bold14.copyWith(color: getTextColor()),
              ),
            ),
            if (isRevised) // Menampilkan hanya jika isRevised true
              const SizedBox(width: 4.0),
            if (isRevised)
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 24,
                ),
                decoration: BoxDecoration(
                  color: getStatusColor(),
                  border: getStatusBorder(),
                  borderRadius: BorderRadius.circular(99.0),
                ),
                child: Text(
                  'direvisi',
                  style: bold14.copyWith(color: getTextColor()),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
