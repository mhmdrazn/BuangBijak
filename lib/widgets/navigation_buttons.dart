import 'package:flutter/material.dart';
import 'package:fp_tekber/data/landing_page.dart';

class NavigationButtons extends StatelessWidget {
  const NavigationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: iconNavFeature.map((route) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, route['route']);
          },
          child: Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey.shade400, // Warna border hitam
                    width: 1.5, // Ketebalan border 1px
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: Icon(
                  route['icon'],
                  size: 30,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                route['title'],
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
