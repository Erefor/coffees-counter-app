import 'package:coffe_counter_app/Pages/CounterPage.dart';
import 'package:coffe_counter_app/Pages/RegistryPage.dart';
import 'package:coffe_counter_app/Providers/UiProvider.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final index = Provider.of<UiProvider>(context).selectedInput;
    switch (index) {
      case 0:
        return CounterPage();
      case 1:
        return RegistryPage();
      default:
        return CounterPage();
    }
  }
}
