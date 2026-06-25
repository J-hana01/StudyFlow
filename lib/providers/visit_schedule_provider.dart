import 'package:flutter/material.dart';

import '../models/visit_schedule.dart';

class VisitScheduleProvider extends ChangeNotifier {

  DateTime baselineDate = DateTime.now();

  List<VisitSchedule> visits = [

    VisitSchedule(
      visitName: "Screening",
      targetDay: 0,
      minusWindow: 0,
      plusWindow: 0,
    ),

    VisitSchedule(
      visitName: "V1",
      targetDay: 14,
      minusWindow: 3,
      plusWindow: 7,
    ),

    VisitSchedule(
      visitName: "V2",
      targetDay: 28,
      minusWindow: 3,
      plusWindow: 7,
    ),

    VisitSchedule(
      visitName: "V3",
      targetDay: 56,
      minusWindow: 7,
      plusWindow: 14,
    ),

    VisitSchedule(
      visitName: "V4",
      targetDay: 84,
      minusWindow: 7,
      plusWindow: 14,
    ),

    VisitSchedule(
      visitName: "EOS",
      targetDay: 112,
      minusWindow: 14,
      plusWindow: 21,
    ),

  ];

  void setBaselineDate(
    DateTime date,
  ) {

    baselineDate = date;

    notifyListeners();

  }

  DateTime getTargetDate(
    VisitSchedule visit,
  ) {

    return baselineDate.add(
      Duration(
        days: visit.targetDay,
      ),
    );

  }

  DateTime getStartDate(
    VisitSchedule visit,
  ) {

    return getTargetDate(
      visit,
    ).subtract(

      Duration(
        days: visit.minusWindow,
      ),

    );

  }

  DateTime getEndDate(
    VisitSchedule visit,
  ) {

    return getTargetDate(
      visit,
    ).add(

      Duration(
        days: visit.plusWindow,
      ),

    );

  }

}
void completeVisit(
  int index,
  DateTime date,
) {

  visits[index].actualDate = date;

  visits[index].completed = true;

  notifyListeners();

}