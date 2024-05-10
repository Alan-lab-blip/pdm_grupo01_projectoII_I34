import 'package:cfmbilheteria/screens/home_page.dart';
import 'package:cfmbilheteria/screens/ticket_page.dart';
import 'package:flutter/material.dart';

class RouteNav extends StatefulWidget {
  RouteNav({super.key, this.selectedIndex = 0});

  int selectedIndex;

  @override
  State<RouteNav> createState() => _RouteNavState();
}

class _RouteNavState extends State<RouteNav> {
  final List<Widget> _pages = [const HomePage(), const TicketPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[widget.selectedIndex!],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.selectedIndex!,
        onTap: onTapItem,
        unselectedLabelStyle: const TextStyle(color: Colors.red),
        selectedItemColor: Color(0xFF258150),
        selectedFontSize: 14,
        items: [
          BottomNavigationBarItem(
            icon: widget.selectedIndex == 0
                ? const ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Color(0xFF258150),
                      BlendMode.srcIn,
                    ),
                    child: Icon(Icons.home),
                  )
                : const Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: widget.selectedIndex == 1
                ? const ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Color(0xFF258150),
                      BlendMode.srcIn,
                    ),
                    child: Icon(Icons.airplane_ticket))
                : const Icon(Icons.airplane_ticket),
            label: 'Bilhetes',
          ),
        ],
      ),
    );
  }

  void onTapItem(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }
}
