import 'package:flutter/material.dart';
import 'package:grocery/model/grocerymodel.dart';

class Homeviewmodel extends ChangeNotifier {
  final List<Grocerymodel> _cartlist = [];
  List<Grocerymodel> get cartlist => _cartlist;
  void addcart(Grocerymodel groceryitem) {
    _cartlist.add(groceryitem);
    notifyListeners();
  }
}
