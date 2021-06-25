import 'package:flutter/material.dart';
class CustomNavigationBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (ind){
        
      },
      selectedItemColor: Colors.brown,
      selectedFontSize: 25,
      currentIndex: 1,
      items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.coffee_outlined),
        label: 'Counter'
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.date_range_outlined),
        label: 'Registry',
      )
    ]);
  }
}