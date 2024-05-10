import 'package:flutter/material.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: 100,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 146, 146, 146),
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [],
            ),
            Text(
              'Seja Bem-Vindo ao Bilheteria Online da CFM $email',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              'Pesquise pela sua estação, reserva o seu bilhete e veja o confirme a reserva na aba bilheteria',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
