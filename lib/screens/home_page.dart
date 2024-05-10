import 'package:cfmbilheteria/screens/trip_details.dart';
import 'package:cfmbilheteria/widgets/drawer_widget.dart';
import 'package:cfmbilheteria/widgets/station_widget.dart';
import 'package:cfmbilheteria/widgets/welcome_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String userEmail;

  @override
  void initState() {
    super.initState();
    getUserEmail(); 
  }

  void getUserEmail() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        userEmail = user.email ??
            'Nenhum email encontrado'; 
      });
    } else {
      setState(() {
        userEmail =
            'Nenhum usuário autenticado'; 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
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
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Pesquisar...',
                          hintStyle:
                              TextStyle(color: Color.fromARGB(255, 90, 90, 90)),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        print('tocavel');
                      },
                      icon: const Icon(Icons.search, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            WelcomeWidget(email: userEmail),
            const SizedBox(height: 20),
            StationWidget(
              station_name: 'Estação da Baixa',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TripDetais()));
              },
            ),
            const SizedBox(height: 20),
            StationWidget(
              station_name: 'Estação de Maracuene',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TripDetais()));
              },
            ),
            const SizedBox(height: 20),
            StationWidget(
              station_name: 'Estação de Manhiça',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TripDetais()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
