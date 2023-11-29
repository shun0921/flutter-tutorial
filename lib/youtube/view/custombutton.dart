import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const CustomButton({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 5.0),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
