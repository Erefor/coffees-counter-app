import 'package:coffe_counter_app/Models/CoffeeModel.dart';
import 'package:coffe_counter_app/Providers/CoffeesProvider.dart';
import 'package:coffe_counter_app/Utils/Utils.dart';
import 'package:coffe_counter_app/Widgets/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final coffeeProvider = Provider.of<CoffeesProvider>(context).coffees;
    
    return Scaffold(
      backgroundColor: Colors.brown,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: double.infinity),
            Icon(Icons.coffee,size: 80,color: Colors.white),
            Text(coffeeProvider.length.toString(),style: TextStyle(color: Colors.white,fontSize: 50)),
            _CoffeeSizeButtonsRow(),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBottomBar(),
    );
  }
}


class _CoffeeSizeButtonsRow extends StatefulWidget {
  @override
  State<_CoffeeSizeButtonsRow> createState() => __CoffeeSizeButtonsRowState();
}

class __CoffeeSizeButtonsRowState extends State<_CoffeeSizeButtonsRow> {
  @override
  void initState() { 
    Provider.of<CoffeesProvider>(context, listen: false).getCoffees();
    super.initState();
  }
  bool isChecked = false;
  dynamic valueItem = 'Small';
  @override
  Widget build(BuildContext context) {
    final coffeeProvider = Provider.of<CoffeesProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton<String>(
          items: getDropItems(),
          dropdownColor: Colors.brown,
          value: valueItem,
          style: TextStyle(color: Colors.white, fontSize: 25),
          onChanged: (e) {
            setState(() {
              valueItem = e;
            });
          },
          alignment: Alignment.center,
          icon: Icon(Icons.arrow_drop_down, color: Colors.white,),
        ),
        SizedBox(width: 20),
        FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.plus_one,
            color: Colors.brown,
            size: 30,
          ),
          onPressed: () {
            String date = getStringDate();
            Coffee newCoffee = Coffee(coffeeInt: 1, size: valueItem, date: date);
            coffeeProvider.addCoffeeRecord(newCoffee); 
          },
        )
      ],
    );
  }
}