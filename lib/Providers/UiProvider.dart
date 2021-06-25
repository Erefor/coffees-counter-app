import 'package:flutter/cupertino.dart';

class UiProvider extends ChangeNotifier{
  int _selectedInput = 0;
  int get selectedInput => _selectedInput;
  set setInput(int i){
    this._selectedInput = i;
    notifyListeners();
  }
}