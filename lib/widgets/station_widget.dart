import 'package:flutter/material.dart';

class StationWidget extends StatelessWidget {
  const StationWidget({super.key, required this.station_name, this.onTap});

  final String station_name;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 400,
      decoration: BoxDecoration(
          color: const Color(0xFF258150),
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              station_name,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Text(
                  'Viagens disponíveis',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    width: 120,
                    height: 35,
                    decoration: BoxDecoration(
                        color: const Color(0xFFFFD600),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                      child: Text(
                        'Bilheteria',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
