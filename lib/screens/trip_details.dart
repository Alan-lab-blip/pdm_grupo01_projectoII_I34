import 'package:cfmbilheteria/helper_functions/helper_functions.dart';
import 'package:cfmbilheteria/widgets/trip_widget.dart';
import 'package:flutter/material.dart';

class TripDetais extends StatefulWidget {
  TripDetais({super.key});

  @override
  State<TripDetais> createState() => _TripDetaisState();
}

class _TripDetaisState extends State<TripDetais> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  String paymentMethod = '';
  String phoneNumberText = '';
  int phoneNumber = 0;

  Future<void> _paymentMethod() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Método de pagamento e número de Celular'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile(
                    title: const Text('Mpesa'),
                    value: 'Mpesa',
                    groupValue: paymentMethod,
                    onChanged: (value) {
                      setState(() {
                        paymentMethod = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Emola'),
                    value: 'Emola',
                    groupValue: paymentMethod,
                    onChanged: (value) {
                      setState(() {
                        paymentMethod = value.toString();
                      });
                    },
                  ),
                  TextField(
                    maxLength: 9,
                    keyboardType: TextInputType.number,
                    controller: phoneNumberController,
                    decoration: const InputDecoration(
                      labelText: 'Número de Telemóvel',
                    ),
                  ),
                ],
              );
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                phoneNumberText = phoneNumberController.text.trim();
                if (phoneNumberController.text.isEmpty) {
                  displayMessageToUser('Preencha todos campos', context);
                } else {
                  phoneNumberController.clear();
                  Navigator.pop(context);
                  _reserveTicket();
                }
              },
              child: const Text('Continuar'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _reserveTicket() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('PIN'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    maxLength: 9,
                    keyboardType: TextInputType.number,
                    controller: pinController,
                    decoration: const InputDecoration(
                      labelText: 'Digite o seu PIN',
                    ),
                  ),
                ],
              );
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (pinController.text.isEmpty) {
                  displayMessageToUser('Digite o seu ping', context);
                  return;
                } else {
                  displayMessageToUser(
                      'Reserva de bilhete para ${phoneNumberText} confirmada.',
                      context);
                  pinController.clear();
                  Navigator.pop(context);
                }
              },
              child: const Text('Reservar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalhes da Viagem',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF258150),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            TripWidget(
                station_name: 'Estação da Baixa',
                departureDate: '07:00 min',
                rota: 'Baixa - Maracuene',
                valor: '50 MT',
                isTripAvaible: true,
                onTap: _paymentMethod)
          ],
        ),
      ),
    );
  }
}
