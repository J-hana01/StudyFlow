class VisitSchedule {

  final String visitName;

  final int targetDay;

  final int minusWindow;

  final int plusWindow;

  DateTime? actualDate;

  bool completed;

  VisitSchedule({

    required this.visitName,

    required this.targetDay,

    required this.minusWindow,

    required this.plusWindow,

    this.actualDate,

    this.completed = false,

  });

}