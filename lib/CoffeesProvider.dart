import 'package:coffe_counter_app/CoffeesDB.dart';
import 'package:flutter/material.dart';

class Coffees with ChangeNotifier {
  int _totalCoffes = 0;
  int get totalCoffes => _totalCoffes;

  void addOne() {
    this._totalCoffes++;
    DBProvider.db.updateCoffees(this._totalCoffes);
    notifyListeners();
  }
}
