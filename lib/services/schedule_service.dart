import '../models/schedule.dart';

class ScheduleService {

  static final List<Schedule> schedules = [];

  static void addSchedule(Schedule schedule) {
    schedules.add(schedule);
  }

}