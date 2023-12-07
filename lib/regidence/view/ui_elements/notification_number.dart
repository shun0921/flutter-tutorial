import 'package:flutter/material.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.notificationCount,
    this.isSelected = false,
  });
  // ignore: inference_failure_on_function_return_type
  final Function() onPressed;
  final String text;
  final String notificationCount;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(100, 40)),
            padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
          ),
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: TextStyle(
              color: isSelected ? Colors.teal : Colors.black,
              fontSize: 13,
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 2,
          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(9),
            ),
            constraints: const BoxConstraints(
              minWidth: 18,
              minHeight: 18,
            ),
            child: Text(
              notificationCount,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
