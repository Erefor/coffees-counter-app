import 'package:coffe_counter_app/Models/CoffeeModel.dart';
import 'package:coffe_counter_app/Providers/CoffeesProvider.dart';
import 'package:coffe_counter_app/Widgets/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: SafeArea(child: _CustomListBuilder()),
      bottomNavigationBar: CustomNavigationBottomBar(),
    );
  }
}

class _CustomListBuilder extends StatelessWidget {
  final fontTextStyle = TextStyle(color: Colors.brown);
  @override
  Widget build(BuildContext context) {
    final coffees = Provider.of<CoffeesProvider>(context);
    final coffeesList = new List.from(coffees.coffees.reversed);
    return ListView.builder(
      reverse: true,
      itemCount: coffeesList.length,
      itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            tileColor: Colors.white,
            leading: getIcon(coffeesList[index]),
            title: Text(coffeesList[index].size,style: fontTextStyle,),
            subtitle: Text(coffeesList[index].date, style: fontTextStyle,),
          ),
        );
      }
    );
  }

  Widget getIcon(Coffee coffee){
    if(coffee.size == 'Small'){
      return Icon(Icons.coffee_outlined,color: Colors.brown,);
    }else if(coffee.size == 'Medium'){
      return Icon(Icons.coffee_rounded,color: Colors.brown);
    }else if(coffee.size == 'Large'){
      return Icon(Icons.coffee_maker_outlined,color: Colors.brown);
    }else{
      return Icon(Icons.coffee_maker_sharp,color: Colors.brown);
    }
  }
}