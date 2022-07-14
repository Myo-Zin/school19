
class StudentResponse {
  bool? status;
  String? message;
  User? user;

  StudentResponse({this.status, this.message, this.user});

  StudentResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? boId;
  String? entityStatus;
  String? role;
  String? name;
  String? image;
  String? phoneNo;
  String? education;
  String? email;
  String? nrc;
  String? dob;
  String? gender;
  String? religion;
  String? nationality;
  String? relationship;
  String? workStatus;
  String? department;
  String? stateRegion;
  String? city;
  String? township;
  String? address;
  String? note;
  String? roleType;
  List<StudentList>? studentList;
  String? job;
  // List<String>? subjectList;

  User(
      {this.boId,
        this.entityStatus,
        this.role,
        this.name,
        this.image,
        this.phoneNo,
        this.education,
        this.email,
        this.nrc,
        this.dob,
        this.gender,
        this.religion,
        this.nationality,
        this.relationship,
        this.workStatus,
        this.department,
        this.stateRegion,
        this.city,
        this.township,
        this.address,
        this.note,
        this.roleType,
        this.studentList,
        this.job,
       // this.subjectList
      });

  User.fromJson(Map<String, dynamic> json) {
    boId = json['boId'];
    entityStatus = json['entityStatus'];
    role = json['role'];
    name = json['name'];
    image = json['image'];
    phoneNo = json['phoneNo'];
    education = json['education'];
    email = json['email'];
    nrc = json['nrc'];
    dob = json['dob'];
    gender = json['gender'];
    religion = json['religion'];
    nationality = json['nationality'];
    relationship = json['relationship'];
    workStatus = json['workStatus'];
    department = json['department'];
    stateRegion = json['stateRegion'];
    city = json['city'];
    township = json['township'];
    address = json['address'];
    note = json['note'];
    roleType = json['roleType'];
    if (json['studentList'] != null) {
      studentList = <StudentList>[];
      json['studentList'].forEach((v) {
        studentList!.add(new StudentList.fromJson(v));
      });
    }
    job = json['job'];
    // if (json['subjectList'] != null) {
    //   subjectList = <String>[];
    //   json['subjectList'].forEach((v) {
    //     subjectList!.add(new String.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['boId'] = this.boId;
    data['entityStatus'] = this.entityStatus;
    data['role'] = this.role;
    data['name'] = this.name;
    data['image'] = this.image;
    data['phoneNo'] = this.phoneNo;
    data['education'] = this.education;
    data['email'] = this.email;
    data['nrc'] = this.nrc;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['religion'] = this.religion;
    data['nationality'] = this.nationality;
    data['relationship'] = this.relationship;
    data['workStatus'] = this.workStatus;
    data['department'] = this.department;
    data['stateRegion'] = this.stateRegion;
    data['city'] = this.city;
    data['township'] = this.township;
    data['address'] = this.address;
    data['note'] = this.note;
    data['roleType'] = this.roleType;
    if (this.studentList != null) {
      data['studentList'] = this.studentList!.map((v) => v.toJson()).toList();
    }
    data['job'] = this.job;
    // if (this.subjectList != null) {
    //   data['subjectList'] = this.subjectList!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class StudentList {
  String? boId;
  String? entityStatus;
  String? studentName;
  String? gender;
  String? dob;
  String? school;
  StudentInfo? studentInfo;
  String? status;

  StudentList(
      {this.boId,
        this.entityStatus,
        this.studentName,
        this.gender,
        this.dob,
        this.school,
        this.studentInfo,
        this.status});

  StudentList.fromJson(Map<String, dynamic> json) {
    boId = json['boId'];
    entityStatus = json['entityStatus'];
    studentName = json['studentName'];
    gender = json['gender'];
    dob = json['dob'];
    school = json['school'];
    studentInfo = json['studentInfo'] != null
        ? StudentInfo.fromJson(json['studentInfo'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['boId'] = this.boId;
    data['entityStatus'] = this.entityStatus;
    data['studentName'] = this.studentName;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['school'] = this.school;
    if (this.studentInfo != null) {
      data['studentInfo'] = this.studentInfo!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class StudentInfo {
  String? boId;
  String? entityStatus;
  String? registerDate;
  String? endDate;
  String? registerId;
  String? year;
  String? passedYear;
  String? passedRollNo;
  String? religion;
  String? nationality;
  String? studentAddress;
  String? relation;
  String? fatherName;
  String? fatherJob;
  String? fatherNrc;
  String? motherName;
  String? motherJob;
  String? motherNrc;
  String? parentPhoneNo;
  String? responsiblePersonName;
  String? responsibleRelation;
  String? responsibleAddress;
  String? responsibleJob;
  String? studentSign;
  String? parentSign;
  String? relationName1;
  String? relationGrade1;
  String? relationName2;
  String? relationGrade2;
  String? relationName3;
  String? relationGrade3;
  String? studentProfile;
  String? fatherNrcFront;
  String? fatherNrcBack;
  String? motherNrcFront;
  String? motherNrcBack;
  String? responsibleNrc;
  String? responsiblePhoneNo;
  String? responsibleNrcFront;
  String? responsibleNrcBack;
  Grade? grade;
  String? passGrade;
  ClassList? studentClass;
  String? studentName;
  String? dob;
  String? studentId;
  String? classId;
  String? gradeId;
  ClassTeacher? classTeacher;
  StudentInfo(
      {this.boId,
        this.entityStatus,
        this.registerDate,
        this.endDate,
        this.registerId,
        this.year,
        this.passedYear,
        this.passedRollNo,
        this.religion,
        this.nationality,
        this.studentAddress,
        this.relation,
        this.fatherName,
        this.fatherJob,
        this.fatherNrc,
        this.motherName,
        this.motherJob,
        this.motherNrc,
        this.parentPhoneNo,
        this.responsiblePersonName,
        this.responsibleRelation,
        this.responsibleAddress,
        this.responsibleJob,
        this.studentSign,
        this.parentSign,
        this.relationName1,
        this.relationGrade1,
        this.relationName2,
        this.relationGrade2,
        this.relationName3,
        this.relationGrade3,
        this.studentProfile,
        this.fatherNrcFront,
        this.fatherNrcBack,
        this.motherNrcFront,
        this.motherNrcBack,
        this.responsibleNrc,
        this.responsiblePhoneNo,
        this.responsibleNrcFront,
        this.responsibleNrcBack,
        this.grade,
        this.passGrade,
        this.studentClass,
        this.studentName,
        this.dob,
        this.studentId,
        this.classId,
        this.gradeId,
        this.classTeacher});

  StudentInfo.fromJson(Map<String, dynamic> json) {
    boId = json['boId'];
    entityStatus = json['entityStatus'];
    registerDate = json['registerDate'];
    endDate = json['endDate'];
    registerId = json['registerId'];
    year = json['year'];
    passedYear = json['passedYear'];
    passedRollNo = json['passedRollNo'];
    religion = json['religion'];
    nationality = json['nationality'];
    studentAddress = json['studentAddress'];
    relation = json['relation'];
    fatherName = json['fatherName'];
    fatherJob = json['fatherJob'];
    fatherNrc = json['fatherNrc'];
    motherName = json['motherName'];
    motherJob = json['motherJob'];
    motherNrc = json['motherNrc'];
    parentPhoneNo = json['parentPhoneNo'];
    responsiblePersonName = json['responsiblePersonName'];
    responsibleRelation = json['responsibleRelation'];
    responsibleAddress = json['responsibleAddress'];
    responsibleJob = json['responsibleJob'];
    studentSign = json['studentSign'];
    parentSign = json['parentSign'];
    relationName1 = json['relationName1'];
    relationGrade1 = json['relationGrade1'];
    relationName2 = json['relationName2'];
    relationGrade2 = json['relationGrade2'];
    relationName3 = json['relationName3'];
    relationGrade3 = json['relationGrade3'];
    studentProfile = json['studentProfile'];
    fatherNrcFront = json['fatherNrcFront'];
    fatherNrcBack = json['fatherNrcBack'];
    motherNrcFront = json['motherNrcFront'];
    motherNrcBack = json['motherNrcBack'];
    responsibleNrc = json['responsibleNrc'];
    responsiblePhoneNo = json['responsiblePhoneNo'];
    responsibleNrcFront = json['responsibleNrcFront'];
    responsibleNrcBack = json['responsibleNrcBack'];
    grade = json['grade'] != null ? new Grade.fromJson(json['grade']) : null;
    passGrade = json['passGrade'];
    studentClass = json['studentClass'] != null
        ? new ClassList.fromJson(json['studentClass'])
        : null;
    studentName = json['studentName'];
    dob = json['dob'];
    studentId = json['studentId'];
    classId = json['classId'];
    gradeId = json['gradeId'];
    classTeacher = json['classTeacher'] != null
        ? new ClassTeacher.fromJson(json['classTeacher'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['boId'] = this.boId;
    data['entityStatus'] = this.entityStatus;
    data['registerDate'] = this.registerDate;
    data['endDate'] = this.endDate;
    data['registerId'] = this.registerId;
    data['year'] = this.year;
    data['passedYear'] = this.passedYear;
    data['passedRollNo'] = this.passedRollNo;
    data['religion'] = this.religion;
    data['nationality'] = this.nationality;
    data['studentAddress'] = this.studentAddress;
    data['relation'] = this.relation;
    data['fatherName'] = this.fatherName;
    data['fatherJob'] = this.fatherJob;
    data['fatherNrc'] = this.fatherNrc;
    data['motherName'] = this.motherName;
    data['motherJob'] = this.motherJob;
    data['motherNrc'] = this.motherNrc;
    data['parentPhoneNo'] = this.parentPhoneNo;
    data['responsiblePersonName'] = this.responsiblePersonName;
    data['responsibleRelation'] = this.responsibleRelation;
    data['responsibleAddress'] = this.responsibleAddress;
    data['responsibleJob'] = this.responsibleJob;
    data['studentSign'] = this.studentSign;
    data['parentSign'] = this.parentSign;
    data['relationName1'] = this.relationName1;
    data['relationGrade1'] = this.relationGrade1;
    data['relationName2'] = this.relationName2;
    data['relationGrade2'] = this.relationGrade2;
    data['relationName3'] = this.relationName3;
    data['relationGrade3'] = this.relationGrade3;
    data['studentProfile'] = this.studentProfile;
    data['fatherNrcFront'] = this.fatherNrcFront;
    data['fatherNrcBack'] = this.fatherNrcBack;
    data['motherNrcFront'] = this.motherNrcFront;
    data['motherNrcBack'] = this.motherNrcBack;
    data['responsibleNrc'] = this.responsibleNrc;
    data['responsiblePhoneNo'] = this.responsiblePhoneNo;
    data['responsibleNrcFront'] = this.responsibleNrcFront;
    data['responsibleNrcBack'] = this.responsibleNrcBack;
    if (this.grade != null) {
      data['grade'] = this.grade!.toJson();
    }
    data['passGrade'] = this.passGrade;
    if (this.studentClass != null) {
      data['studentClass'] = this.studentClass!.toJson();
    }
    data['studentName'] = this.studentName;
    data['dob'] = this.dob;
    data['studentId'] = this.studentId;
    data['classId'] = this.classId;
    data['gradeId'] = this.gradeId;
    if (this.classTeacher != null) {
      data['classTeacher'] = this.classTeacher!.toJson();
    }
    return data;
  }
}

class Grade {
  String? boId;
  String? entityStatus;
  String? name;
  String? maximumStudentCount;
  String? createDate;
  String? note;
  List<SubjectList>? subjectList;
  List<ClassList>? classList;

  Grade(
      {this.boId,
        this.entityStatus,
        this.name,
        this.maximumStudentCount,
        this.createDate,
        this.note,
        this.subjectList,
        this.classList});

  Grade.fromJson(Map<String, dynamic> json) {
    boId = json['boId'];
    entityStatus = json['entityStatus'];
    name = json['name'];
    maximumStudentCount = json['maximumStudentCount'];
    createDate = json['createDate'];
    note = json['note'];
    if (json['subjectList'] != null) {
      subjectList = <SubjectList>[];
      json['subjectList'].forEach((v) {
        subjectList!.add(new SubjectList.fromJson(v));
      });
    }
    if (json['classList'] != null) {
      classList = <ClassList>[];
      json['classList'].forEach((v) {
        classList!.add(new ClassList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['boId'] = this.boId;
    data['entityStatus'] = this.entityStatus;
    data['name'] = this.name;
    data['maximumStudentCount'] = this.maximumStudentCount;
    data['createDate'] = this.createDate;
    data['note'] = this.note;
    if (this.subjectList != null) {
      data['subjectList'] = this.subjectList!.map((v) => v.toJson()).toList();
    }
    if (this.classList != null) {
      data['classList'] = this.classList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubjectList {
  String? boId;
  String? entityStatus;
  String? name;

  SubjectList({this.boId, this.entityStatus, this.name});

  SubjectList.fromJson(Map<String, dynamic> json) {
    boId = json['boId'];
    entityStatus = json['entityStatus'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['boId'] = this.boId;
    data['entityStatus'] = this.entityStatus;
    data['name'] = this.name;
    return data;
  }
}

class ClassList {
  String? boId;
  String? entityStatus;
  String? name;
  String? maximumStudentCount;
  String? note;

  ClassList(
      {this.boId,
        this.entityStatus,
        this.name,
        this.maximumStudentCount,
        this.note});

  ClassList.fromJson(Map<String, dynamic> json) {
    boId = json['boId'];
    entityStatus = json['entityStatus'];
    name = json['name'];
    maximumStudentCount = json['maximumStudentCount'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['boId'] = this.boId;
    data['entityStatus'] = this.entityStatus;
    data['name'] = this.name;
    data['maximumStudentCount'] = this.maximumStudentCount;
    data['note'] = this.note;
    return data;
  }
}
class ClassTeacher {
  String? boId;
  String? entityStatus;
  String? role;
  String? name;
  String? image;
  String? phoneNo;
  String? education;
  String? email;
  String? nrc;
  String? dob;
  String? gender;
  String? religion;
  String? nationality;
  String? relationship;
  String? workStatus;
  String? department;
  String? stateRegion;
  String? city;
  String? township;
  String? address;
  String? note;
  String? roleType;
  List<String>? studentList;
  String? job;
  List<String>? subjectList;

  ClassTeacher(
      {this.boId,
        this.entityStatus,
        this.role,
        this.name,
        this.image,
        this.phoneNo,
        this.education,
        this.email,
        this.nrc,
        this.dob,
        this.gender,
        this.religion,
        this.nationality,
        this.relationship,
        this.workStatus,
        this.department,
        this.stateRegion,
        this.city,
        this.township,
        this.address,
        this.note,
        this.roleType,
        this.studentList,
        this.job,
        this.subjectList});

  ClassTeacher.fromJson(Map<String, dynamic> json) {
    boId = json['boId'];
    entityStatus = json['entityStatus'];
    role = json['role'];
    name = json['name'];
    image = json['image'];
    phoneNo = json['phoneNo'];
    education = json['education'];
    email = json['email'];
    nrc = json['nrc'];
    dob = json['dob'];
    gender = json['gender'];
    religion = json['religion'];
    nationality = json['nationality'];
    relationship = json['relationship'];
    workStatus = json['workStatus'];
    department = json['department'];
    stateRegion = json['stateRegion'];
    city = json['city'];
    township = json['township'];
    address = json['address'];
    note = json['note'];
    roleType = json['roleType'];
    // if (json['studentList'] != null) {
    //   studentList = <String>[];
    //   json['studentList'].forEach((v) {
    //     studentList!.add(new String.fromJson(v));
    //   });
    // }
    job = json['job'];
    // if (json['subjectList'] != null) {
    //   subjectList = <String>[];
    //   json['subjectList'].forEach((v) {
    //     subjectList!.add(new String.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['boId'] = this.boId;
    data['entityStatus'] = this.entityStatus;
    data['role'] = this.role;
    data['name'] = this.name;
    data['image'] = this.image;
    data['phoneNo'] = this.phoneNo;
    data['education'] = this.education;
    data['email'] = this.email;
    data['nrc'] = this.nrc;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['religion'] = this.religion;
    data['nationality'] = this.nationality;
    data['relationship'] = this.relationship;
    data['workStatus'] = this.workStatus;
    data['department'] = this.department;
    data['stateRegion'] = this.stateRegion;
    data['city'] = this.city;
    data['township'] = this.township;
    data['address'] = this.address;
    data['note'] = this.note;
    data['roleType'] = this.roleType;
    // if (this.studentList != null) {
    //   data['studentList'] = this.studentList!.map((v) => v.toJson()).toList();
    // }
    data['job'] = this.job;
    // if (this.subjectList != null) {
    //   data['subjectList'] = this.subjectList!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}