import 'package:cfmbilheteria/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bilhetes',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF258150),
      ),
      body: const Center(
        child: Text('Você ainda não reservou bilhetes'),
      ),
      drawer: const DrawerWidget(),
    );
  }
}
