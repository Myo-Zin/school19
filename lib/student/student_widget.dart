import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school19/daily_report/daily_report_list_screen.dart';
import 'package:school19/student/student_controller.dart';
import 'package:school19/widget/loading_widget.dart';

class StudentsWidget extends ConsumerStatefulWidget {
  const StudentsWidget(this.from, {Key? key}) : super(key: key);
  final String from;

  @override
  ConsumerState<StudentsWidget> createState() => _State();
}

class _State extends ConsumerState<StudentsWidget> {
  String studentClass = "";
  String studentGrade = "";
  String classTeacher = "";
  String gradeId = "";
  String classId = "";
  String studentId = "";

  @override
  Widget build(BuildContext context) {
    final studentResponse = ref.watch(studentProvider);
    int selectedValue = ref.watch(studentChangeProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16.0,),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: studentResponse.when(
                data: (data) {
                  final students = data;
                  if (students.length >= 2) {
                    studentClass = students[selectedValue]
                            .studentInfo
                            ?.studentClass
                            ?.name ??
                        "";
                    studentGrade =
                        students[selectedValue].studentInfo?.grade?.name ?? "";
                    classTeacher = students[selectedValue]
                            .studentInfo
                            ?.classTeacher
                            ?.name ??
                        "";
                    gradeId =
                        students[selectedValue].studentInfo?.grade?.boId ?? "";
                    classId = students[selectedValue]
                            .studentInfo
                            ?.studentClass
                            ?.boId ??
                        "";
                    studentId = students[selectedValue].boId??"";
                  } else {
                    studentClass =
                        students[0].studentInfo?.studentClass?.name ?? "";
                    studentGrade = students[0].studentInfo?.grade?.name ?? "";
                    classTeacher =
                        students[0].studentInfo?.classTeacher?.name ?? "";
                    gradeId = students[0].studentInfo?.grade?.boId ?? "";
                    classId = students[0].studentInfo?.studentClass?.boId ?? "";
                    studentId = students[0].boId??"";
                  }

                  final Map<int, Widget> map = {};
                  for (int i = 0; i < students.length; i++) {
                    map[i] = Padding(
                      padding: const EdgeInsets.all(16),
                      child:
                          Expanded(child: Text("${students[i].studentName}")),
                    );
                  }
                  //String? selectedValue = map.keys.first;

                  // print("${students.first.studentInfo?.studentClass?.boId}");

                  return students.length >= 2
                      ? CupertinoSegmentedControl<int>(
                          selectedColor:
                              Theme.of(context).colorScheme.secondary,
                          unselectedColor: CupertinoColors.systemGrey5,
                          borderColor: CupertinoColors.systemGrey2,
                          pressedColor: Theme.of(context).colorScheme.secondary,
                          groupValue: selectedValue,
                          children: map,
                          onValueChanged: (value) {
                            print("$value");
                            ref.read(studentChangeProvider.notifier).state =
                                value;
                          },
                        )
                      : Container(
                          color: Theme.of(context).colorScheme.secondary,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Expanded(
                                child: Text(
                              "${students.first.studentName}",
                              style: const TextStyle(color: Colors.white),
                            )),
                          ),
                        );
                },
                error: (error, stack) {
                  print("$error");
                  return const Text('');
                },
                loading: () => Center(child: loading()))),
        const SizedBox(
          height: 16.0,
        ),
         Expanded(child: DailyReportListWidget(gradeId,classId))
        // if(widget.from == "timetable")
        //   _forTimeTableWidget()
        // else if(widget.from == "attendance")
        //   AttendanceTableWidget(studentId)
        // else if(widget.from == "teachers")
        //   Expanded(child: AllTeacherWidget(classId,gradeId))
        //  else if(widget.from == "leave")
        //    LeaveListWidget(studentId)
        //  else if(widget.from == "create_leave")
        //    Expanded(child: LeaveWidget(studentId))
        //  else if(widget.from == "payment")
        //    const PaymentWidget()
        //  else if (widget.from == "home_work")
        //    const Expanded(child: HomeWorkWidget())
        //  else if (widget.from == "notification")
        //     Expanded(child: NotificationListWidget(studentId))
      ],
    );

  }
  Widget _forTimeTableWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

      Text("$studentGrade,အခန်း($studentClass)"),
      const SizedBox(
        height: 8.0,
      ),
      Text(classTeacher),
      const SizedBox(
        height: 16.0,
      ),

     // TimeTableWidget(gradeId, classId),
      const SizedBox(
        height: 16.0,
      ),
      //SubjectAndTeacherWidget(gradeId, classId)
    ],);
  }
}
