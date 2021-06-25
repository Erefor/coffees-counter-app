import 'package:coffe_counter_app/Providers/CoffeesProvider.dart';
import 'package:coffe_counter_app/HomePage.dart';
import 'package:coffe_counter_app/Providers/UiProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=> CoffeesProvider(),),
          ChangeNotifierProvider(create: (context)=> UiProvider(),),
        ],
        child: HomePage(),
      )
    );
  }
}
