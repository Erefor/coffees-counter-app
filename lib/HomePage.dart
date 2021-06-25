import 'package:coffe_counter_app/Providers/CoffeesProvider.dart';
import 'package:coffe_counter_app/Widgets/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'Models/CoffeeModel.dart';

class HomePage extends StatelessWidget {
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
            Icon(
              Icons.coffee,
              size: 80,
              color: Colors.white,
            ),
            Text(coffeeProvider.length.toString(),
              style: TextStyle(color: Colors.white),
            ),
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
    return Column(
      children: [
        DropdownButton<String>(
          items: _getDropItems(),
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
        FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.plus_one,
            color: Colors.brown,
            size: 40,
          ),
          onPressed: () {
            String date = _getStringdate();
            Coffee newCoffee = Coffee(coffeeInt: 1, size: valueItem, date: date);
            coffeeProvider.addCoffeeRecord(newCoffee); 
          },
        )
      ],
    );
  }

  List<DropdownMenuItem<String>> _getDropItems() {
    List<String> sizes = ['Small', 'Medium', 'Large', 'Extra Large'];
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (int i = 0; i < sizes.length; i++) {
      String size = sizes[i];
      DropdownMenuItem<String> dropDownItem = DropdownMenuItem<String>(
        child: Text(size),
        value: size,
      );
      dropDownItems.add(dropDownItem);
    }
    return dropDownItems;
  }

  String _getStringdate() {
    var now = DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedTime = DateFormat('kk:mm:a').format(now);
    String formattedDate = formatter.format(now);
    String completeDate = '$formattedDate $formattedTime';
    return completeDate;
  }
}
