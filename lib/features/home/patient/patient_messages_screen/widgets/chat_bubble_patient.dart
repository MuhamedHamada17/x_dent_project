import 'package:flutter/material.dart';
import 'package:x_dent_project/core/theiming/colors.dart';

class ChatBubblePatient extends StatelessWidget {
  final String message;
  const ChatBubblePatient({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ColorsManager.Blue,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(22),
            topRight: Radius.circular(22),
            bottomRight: Radius.circular(22),
          ),
        ),
        child: Text(message, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
