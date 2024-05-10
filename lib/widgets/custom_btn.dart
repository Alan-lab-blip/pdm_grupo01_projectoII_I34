import 'package:flutter/material.dart';

class CusttomBtn extends StatelessWidget {
  const CusttomBtn({super.key, this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 35,
        decoration: BoxDecoration(
            color: const Color(0xFFFFD600),
            borderRadius: BorderRadius.circular(5)),
        child: const Center(
          child: Text(
            'Reservar',
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
