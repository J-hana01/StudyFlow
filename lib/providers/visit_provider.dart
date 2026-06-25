import 'package:flutter/material.dart';

import '../models/visit.dart';

class VisitProvider extends ChangeNotifier {

  List<Visit> visits = [

    Visit(name: "Screening"),
    Visit(name: "V1"),
    Visit(name: "V2"),
    Visit(name: "V3"),
    Visit(name: "V4"),
    Visit(name: "EOS"),

  ];

  void toggleVisit(
    int index,
  ) {

    visits[index].completed =
        !visits[index].completed;

    notifyListeners();

  }

}