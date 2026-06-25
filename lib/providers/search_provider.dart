import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {

  String searchText = "";

  void updateSearch(
    String value,
  ) {

    searchText = value;

    notifyListeners();

  }

}