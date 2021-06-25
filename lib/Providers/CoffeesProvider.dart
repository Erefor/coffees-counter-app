import 'package:coffe_counter_app/Models/CoffeeModel.dart';
import 'package:coffe_counter_app/Providers/DBProvider.dart';
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
  int get smallCoffees{
    int smallCoffees = 0;
    for(int i = 0; i< this._coffees.length;i++){
      if(this._coffees[i].size == 'Small'){
        smallCoffees++;
      }
    }
    return smallCoffees;
  }
}
