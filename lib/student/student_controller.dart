import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school19/student/student_repository.dart';
import 'package:school19/student/student_response_model.dart';



final studentController = FutureProvider<StudentResponse>((ref) async {
  final result = ref.read(studentRepositoryProvider).getDataForStudent();
  return result;
});

final studentProvider =
StateNotifierProvider<StudentDataNotifier, AsyncValue<List<StudentList>>>(
        (ref) => StudentDataNotifier(ref));

class StudentDataNotifier extends StateNotifier<AsyncValue<List<StudentList>>> {
  final Ref ref;

  StudentDataNotifier(this.ref) : super(AsyncValue.loading()) {
    init();
  }

  void init() async {
    state = const AsyncValue.loading();
    try {
      final studentResponse =
          await ref.read(studentRepositoryProvider).getDataForStudent();
      final List<StudentList> students =
          studentResponse.user?.studentList ?? [];
      //ref.read(studentChangeController.state).state = students.first.studentInfo!.studentName?? "";
      state = AsyncValue.data(students);
    } catch (e) {
      state = AsyncValue.error(e);
    }
  }
}
final studentInfoController = StateNotifierProvider<StudentInfoNotifier,StudentInfo>((ref) => StudentInfoNotifier() );
class StudentInfoNotifier extends StateNotifier<StudentInfo>{
  StudentInfoNotifier(): super(StudentInfo());

  void changeStudentInfo(StudentList student){
     state = [student.studentInfo] as StudentInfo;
  }

}

final studentChangeProvider = StateProvider<int>(
      (ref) => 0,
);