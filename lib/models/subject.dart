class Subject {

  int? id;

  final String studyName;
  final String subjectNumber;
  final String sex;
  final DateTime birthDate;

  Subject({

    this.id,

    required this.studyName,
    required this.subjectNumber,
    required this.sex,
    required this.birthDate,

  });

  Map<String, dynamic> toMap() {

    return {

      'id': id,
      'studyName': studyName,
      'subjectNumber': subjectNumber,
      'sex': sex,
      'birthDate': birthDate.toIso8601String(),

    };

  }

  factory Subject.fromMap(
      Map<String, dynamic> map,
      ) {

    return Subject(

      id: map['id'],

      studyName: map['studyName'],

      subjectNumber: map['subjectNumber'],

      sex: map['sex'],

      birthDate: DateTime.parse(
        map['birthDate'],
      ),

    );

  }

}