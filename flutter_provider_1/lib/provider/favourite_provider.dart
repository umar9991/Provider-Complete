
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FavouriteProvider with ChangeNotifier{
  List<int> _selectedItems = [];

  List<int> get selectedItems => _selectedItems;

  void addItem(int value){

   _selectedItems.add(value);
   notifyListeners();

   }
  void removeItems(int value){

   _selectedItems.remove(value);
   notifyListeners();

   }

}