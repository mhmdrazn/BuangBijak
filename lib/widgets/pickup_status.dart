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
      return status == 'cancel' ? Colors.white : black;
    }

    Border? getStatusBorder() {
      return status == 'pending' ? Border.all(color: grey3, width: 2) : null;
    }

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
            color: getStatusColor(),
            border: getStatusBorder(),
            borderRadius: BorderRadius.circular(99.0),
          ),
          child: Text(
            status,
            style: bold14.copyWith(color: getTextColor()),
          ),
        ),
      ],
    );
  }
}
