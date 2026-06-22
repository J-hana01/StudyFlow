class Schedule {

  int? id;

  final String studyName;
  final String subjectNumber;
  final String visit;
  final DateTime dateTime;

  Schedule({

    this.id,

    required this.studyName,
    required this.subjectNumber,
    required this.visit,
    required this.dateTime,

  });

  Map<String, dynamic> toMap() {

    return {

      'id': id,
      'studyName': studyName,
      'subjectNumber': subjectNumber,
      'visit': visit,
      'dateTime': dateTime.toIso8601String(),

    };

  }

  factory Schedule.fromMap(
      Map<String, dynamic> map,
      ) {

    return Schedule(

      id: map['id'],

      studyName: map['studyName'],

      subjectNumber: map['subjectNumber'],

      visit: map['visit'],

      dateTime: DateTime.parse(
        map['dateTime'],
      ),

    );

  }

}