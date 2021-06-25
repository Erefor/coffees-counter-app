import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
List<DropdownMenuItem<String>> getDropItems() {
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

String getStringDate() {
  var now = DateTime.now();
  var formatter = new DateFormat('dd-MM-yyyy');
  String formattedTime = DateFormat('kk:mm:a').format(now);
  String formattedDate = formatter.format(now);
  String completeDate = '$formattedDate $formattedTime';
  return completeDate;
}