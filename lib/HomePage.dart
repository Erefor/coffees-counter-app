import 'package:coffe_counter_app/CoffeesProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
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
            Icon(
              Icons.coffee,
              size: 80,
              color: Colors.white,
            ),
            Text(
              8.toString(),
              style: TextStyle(color: Colors.white),
            ),
            _CoffeeSizeButtonsRow()
          ],
        ),
      ),
    );
  }
}

class _CoffeeSizeButtonsRow extends StatefulWidget {
  @override
  State<_CoffeeSizeButtonsRow> createState() => __CoffeeSizeButtonsRowState();
}

class __CoffeeSizeButtonsRowState extends State<_CoffeeSizeButtonsRow> {
  bool isChecked = false;
  dynamic valueItem = 'Small';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: _getDropItems(),
      dropdownColor: Colors.brown,
      value: valueItem,
      style: TextStyle(color: Colors.white, fontSize: 25),
      onChanged: (e) {
        setState(() {
          valueItem = e;
        });
      },
    );
  }

  List<DropdownMenuItem<String>> _getDropItems() {
    List<String> sizes = ['Small', 'Medium', 'Large'];
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
}
