import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../models/schedule.dart';

class ScheduleProvider extends ChangeNotifier {

  List<Schedule> schedules = [];

  ScheduleProvider() {
    loadSchedules();
  }

  Future<void> loadSchedules() async {

    schedules = await DatabaseHelper.instance
        .getSchedules();

    notifyListeners();

  }

  Future<void> addSchedule(
    Schedule schedule,
  ) async {

    await DatabaseHelper.instance
        .insertSchedule(schedule);

    await loadSchedules();

  }

  Future<void> removeSchedule(
    Schedule schedule,
  ) async {

    if (schedule.id != null) {

      await DatabaseHelper.instance
          .deleteSchedule(
            schedule.id!,
          );

    }

    await loadSchedules();

  }

  Future<void> updateSchedule(
    Schedule schedule,
  ) async {

    await DatabaseHelper.instance
        .updateSchedule(schedule);

    await loadSchedules();

  }

}