import 'package:coffe_counter_app/CoffeeModel.dart';
import 'package:coffe_counter_app/DBProvider.dart';
import 'package:flutter/cupertino.dart';

class CoffeesProvider with ChangeNotifier {
  List<Coffee> _coffees = [];
  List<Coffee> get coffees => _coffees;
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
}
