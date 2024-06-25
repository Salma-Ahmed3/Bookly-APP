import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'For Fun, Look At The Newest Books As Well.',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      // textAlign: TextAlign.center,
    );
  }
}
