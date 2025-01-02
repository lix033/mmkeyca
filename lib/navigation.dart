import 'package:flutter/material.dart';
import 'package:mykey/add_key.dart';
import 'package:mykey/list_key.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

    int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [KeyList(), AddKey()];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_max_rounded)),
          BottomNavigationBarItem(icon: Icon(Icons.list_rounded))
        ],
      ),
    );
  }
}