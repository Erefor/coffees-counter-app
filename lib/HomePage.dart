import 'package:coffe_counter_app/CoffeesProvider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Coffees _coffees = Coffees.coffees;
  int _totalCoffees = 0;
  @override
  void initState() {
    _coffees.getCoffeesCounter();
    _totalCoffees = _coffees.totalCoffees;
    super.initState();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: double.infinity),
            Icon(Icons.coffee,size: 80,color: Colors.white,),
            Text(_totalCoffees.toString(),
            style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}