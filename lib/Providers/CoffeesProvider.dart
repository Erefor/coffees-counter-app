import 'package:coffe_counter_app/Models/CoffeeModel.dart';
import 'package:coffe_counter_app/Providers/DBProvider.dart';
import 'package:flutter/material.dart';

class CoffeesProvider with ChangeNotifier {
  List<Coffee> _coffees = [];
  List<Coffee> get coffees => _coffees;
  IconData _icono = Icons.coffee_maker;
  void addCoffeeRecord(Coffee coffee) async {
    final newCoffee = Coffee(
        coffeeInt: coffee.coffeeInt, size: coffee.size, date: coffee.date);
    final id = await DBProvider.db.newCoffee(coffee);
    newCoffee.id = id;
    _coffees.add(newCoffee);
    DBProvider.db.newCoffee(newCoffee);
    getCoffees();
    notifyListeners();
  }

  void getCoffees() async {
    print('Se llama getCoffees');
    this._coffees = await DBProvider.db.getAllCoffees();
    print('Se devolvió el query');
    notifyListeners();
  }

  void killDB() {
    DBProvider.db.killDataBase();
  }

  IconData get getIcon => this._icono;
  int get smallCoffees {
    int smallCoffees = 0;
    for (int i = 0; i < this._coffees.length; i++) {
      if (this._coffees[i].size == 'Small') {
        smallCoffees++;
      }
    }
    return smallCoffees;
  }

  int get mediumCoffees {
    int mediumCoffees = 0;
    for (int i = 0; i < this._coffees.length; i++) {
      if (this._coffees[i].size == 'Medium') {
        mediumCoffees++;
      }
    }
    return mediumCoffees;
  }

  int get largeCoffees {
    int largeCoffees = 0;
    for (int i = 0; i < this._coffees.length; i++) {
      if (this._coffees[i].size == 'Large') {
        largeCoffees++;
      }
    }
    return largeCoffees;
  }

  int get extraLargeCoffees {
    int extraLargeCoffees = 0;
    for (int i = 0; i < this._coffees.length; i++) {
      if (this._coffees[i].size == 'Extra Large') {
        extraLargeCoffees++;
      }
    }
    return extraLargeCoffees;
  }

  set setSizeIcon(String? size) {
    switch (size) {
      case 'Small':
        this._icono = Icons.coffee_outlined;
        notifyListeners();
        break;
      case 'Medium':
        this._icono = Icons.coffee;
        notifyListeners();
        break;
      case 'Large':
        this._icono = Icons.coffee_maker_outlined;
        notifyListeners();
        break;
      case 'Extra Large':
        this._icono = Icons.coffee_maker;
        notifyListeners();
        break;
      default:
        this._icono = Icons.battery_unknown_sharp;
        notifyListeners();
    }
  }
}
