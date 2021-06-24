import 'package:coffe_counter_app/CoffeesProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget{
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
            Text(8.toString(),
            style: TextStyle(color: Colors.white),),
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
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(value: true, onChanged: (value){},)
      ],
    );
  }
}