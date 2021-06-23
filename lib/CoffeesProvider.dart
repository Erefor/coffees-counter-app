import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Coffees{
  static final coffees = Coffees._();
  Coffees._();
  late int _totalCoffes;
  int get totalCoffees => _totalCoffes;

  void addOne() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this._totalCoffes++;
    await prefs.setInt('counter', this._totalCoffes); 
  }
  void getCoffeesCounter()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _totalCoffes = prefs.getInt('counter') ?? 0;
  } 
}
class Coffee {
  Coffee({
      this.coffeeInt =1,
      this.size = 'small',
      this.date = '1-1-2021',
      this.id = 1
  });
  int coffeeInt;
  String size;
  String date;
  int id;

  factory Coffee.fromJson(Map<String, dynamic> json) => Coffee(
      coffeeInt: json["int"],
      size: json["size"],
      date: json["date"],
  );
  Map<String, dynamic> toJson() => {
      "int": coffeeInt,
      "size": size,
      "date": date,
  };
}
