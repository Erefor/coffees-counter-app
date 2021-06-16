import 'dart:ui';

import 'package:coffe_counter_app/CoffeesProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final coffeProvider = Provider.of<Coffees>(context);
    return Scaffold(
      backgroundColor: Colors.brown,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CoffeeHeader(),
            Stack(
              children: <Widget>[
                _WhiteBackground(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                    ),
                    Text(
                      'Coffee Size',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 50,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CoffeeSizeButton(size: 'S'),
                        CoffeeSizeButton(size: 'M'),
                        CoffeeSizeButton(size: 'L'),
                      ],
                    ),
                    MaterialButton(
                      onPressed: () {
                        coffeProvider.addOne();
                      },
                      child: Text(
                        'Add one',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                      color: Colors.brown,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CoffeeSizeButton extends StatelessWidget {
  CoffeeSizeButton({this.size = 'S'});
  final String size;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Text(
        this.size,
        style: TextStyle(
          fontSize: 45,
        ),
      ),
      backgroundColor: Colors.brown,
      onPressed: () {},
    );
  }
}

class CoffeeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final coffeProvider = Provider.of<Coffees>(context);
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Icon(
          Icons.coffee,
          color: Colors.white,
          size: MediaQuery.of(context).size.height * 0.15,
        ),
        Text(
          coffeProvider.totalCoffes.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 80,
          ),
        )
      ],
    );
  }
}

class _WhiteBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
    );
  }
}
