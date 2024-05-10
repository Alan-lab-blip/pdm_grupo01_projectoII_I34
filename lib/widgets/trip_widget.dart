// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cfmbilheteria/widgets/custom_btn.dart';
import 'package:cfmbilheteria/widgets/info_details.dart';
import 'package:flutter/material.dart';

class TripWidget extends StatelessWidget {
  const TripWidget(
      {super.key,
      required this.station_name,
      required this.departureDate,
      this.onTap,
      required this.rota,
      required this.valor,
      required this.isTripAvaible});

  final String station_name;
  final String departureDate;
  final Function()? onTap;
  final String rota;
  final String valor;
  final bool isTripAvaible;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 235,
      width: 400,
      decoration: BoxDecoration(
          color: const Color(0xFF258150),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              station_name,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Text(
              isTripAvaible ? 'Viagem disponível' : 'Viagem indisponível',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  departureDate,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 5),
            InfoDetais(text: rota, text_valor: valor),
            const SizedBox(height: 10),
            CusttomBtn(
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
