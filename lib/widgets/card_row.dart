import 'package:flutter/material.dart';

class CardRow extends StatelessWidget {
  const CardRow({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          color: const Color.fromARGB(255, 50, 49, 49),
        ),
        Container(
          color: Colors.white,
          child: Text("CardRow"),
        ),
      ],
    );
  }
}
