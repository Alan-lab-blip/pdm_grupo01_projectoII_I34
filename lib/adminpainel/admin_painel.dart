import 'package:cfmbilheteria/screens/trip_details.dart';
import 'package:cfmbilheteria/widgets/drawer_widget.dart';
import 'package:cfmbilheteria/widgets/input_field.dart';
import 'package:cfmbilheteria/widgets/station_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminPainel extends StatefulWidget {
  const AdminPainel({super.key});

  @override
  State<AdminPainel> createState() => _AdminPainelState();
}

class _AdminPainelState extends State<AdminPainel> {
  late String userEmail;
  TextEditingController estacaoController = TextEditingController();
  TextEditingController paritdaController = TextEditingController();
  TextEditingController rotaController = TextEditingController();
  TextEditingController valorController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserEmail();
  }

  void getUserEmail() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        userEmail = user.email ?? 'Nenhum email encontrado';
      });
    } else {
      setState(() {
        userEmail = 'Nenhum usuário autenticado';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          userEmail,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF258150),
      ),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Container(
              width: 300,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.red,
              ),
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Painel do Administradors',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          child: Text(
                            'Adicione estações e viagens',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Estação'),
            const SizedBox(height: 4),
            InputField(controller: estacaoController),
            const SizedBox(height: 20),
            const Text('Hora de partida'),
            const SizedBox(height: 4),
            InputField(controller: paritdaController),
            const SizedBox(height: 20),
            const Text('Rota'),
            const SizedBox(height: 4),
            InputField(controller: rotaController),
            const SizedBox(height: 20),
            const Text('Valor'),
            const SizedBox(height: 4),
            InputField(controller: valorController),
            const SizedBox(height: 20),
            const SizedBox(height: 4),
            const SizedBox(height: 20),
            Container(
              width: 300,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.green,
              ),
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Adicionar',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            StationWidget(
              station_name: 'Estação da Baixa',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TripDetais()));
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
