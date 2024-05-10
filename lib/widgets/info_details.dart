import 'package:flutter/material.dart';

class InfoDetais extends StatelessWidget {
  const InfoDetais({super.key, required this.text, required this.text_valor});

  final String text;
  final String text_valor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 320,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 225, 225, 225),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                  fontSize: 17,
                  color: Color.fromARGB(255, 26, 26, 26),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              text_valor,
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
