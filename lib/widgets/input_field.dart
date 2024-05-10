import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
const InputField({Key? key, required this.controller, this.obscureText = false});

  final TextEditingController controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          color: const Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: const InputDecoration(
            border: InputBorder.none,
            // Adicione outros estilos de decoração aqui, se necessário
          ),
        ),
      ),
    );
  }
}
