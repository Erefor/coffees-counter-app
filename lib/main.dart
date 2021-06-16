import 'package:coffe_counter_app/CoffeesProvider.dart';
import 'package:coffe_counter_app/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => Coffees(),
        child: HomePage(),
      ),
    );
  }
}
