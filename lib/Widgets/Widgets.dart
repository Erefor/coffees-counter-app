import 'package:coffe_counter_app/Providers/UiProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CustomNavigationBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    return BottomNavigationBar(
      onTap: (ind){
        uiProvider.setInput = ind;
      },
      selectedItemColor: Colors.brown,
      selectedFontSize: 25,
      currentIndex: uiProvider.selectedInput,
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