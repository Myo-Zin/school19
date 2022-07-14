import 'package:equatable/equatable.dart';

class MyParameter extends Equatable {
  const MyParameter(
      this.studentId, this.gradeId, this.classId, this.month, this.year);

  final String studentId;
  final String gradeId;
  final String classId;
  final String month;
  final String year;

  @override
  List<Object> get props => [studentId, gradeId, classId, month, year];
}
