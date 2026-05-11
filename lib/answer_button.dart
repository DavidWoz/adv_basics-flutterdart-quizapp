import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onButtonPressed,
  });

  final String answerText;
  final void Function() onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onButtonPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        backgroundColor: const Color.fromARGB(255, 35, 1, 120),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
        ),
      ),
      child: Text(answerText),
    );
  }
}
