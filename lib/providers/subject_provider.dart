import 'package:flutter/material.dart';

import '../models/subject.dart';

class SubjectProvider extends ChangeNotifier {

  List<Subject> subjects = [];

  void addSubject(
    Subject subject,
  ) {

    subjects.add(subject);

    notifyListeners();

  }

}