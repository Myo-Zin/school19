import 'package:school19/login/login_response_model.dart';

class DailyReportResponse {
  List<Data>? data;
  bool? status;
  String? message;
  int? lastPage;
  String? totalCount;

  DailyReportResponse(
      {this.data, this.status, this.message, this.lastPage, this.totalCount});

  DailyReportResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
    lastPage = json['last_page'];
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    data['last_page'] = this.lastPage;
    data['totalCount'] = this.totalCount;
    return data;
  }
}

class Data {
  String? boId;
  String? entityStatus;
  User? user;
  Grade? grade;
  ClassList? studentClass;
  SubjectList? subject;
  String? body;
  String? sentDate;
  List<ReplyList>? replyList;
  ReplyList? reply;

  Data(
      {this.boId,
        this.entityStatus,
        this.user,
        this.grade,
        this.studentClass,
        this.subject,
        this.body,
        this.sentDate,
        this.replyList,
        this.reply});

  Data.fromJson(Map<String, dynamic> json) {
    boId = json['boId'];
    entityStatus = json['entityStatus'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    grade = json['grade'] != null ? new Grade.fromJson(json['grade']) : null;
    studentClass = json['studentClass'] != null
        ? new ClassList.fromJson(json['studentClass'])
        : null;
    subject = json['subject'] != null
        ? new SubjectList.fromJson(json['subject'])
        : null;
    body = json['body'];
    sentDate = json['sentDate'];
    if (json['replyList'] != null) {
      replyList = <ReplyList>[];
      json['replyList'].forEach((v) {
        replyList!.add(new ReplyList.fromJson(v));
      });
    }
    reply =
    json['reply'] != null ? new ReplyList.fromJson(json['reply']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['boId'] = this.boId;
    data['entityStatus'] = this.entityStatus;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.grade != null) {
      data['grade'] = this.grade!.toJson();
    }
    if (this.studentClass != null) {
      data['studentClass'] = this.studentClass!.toJson();
    }
    if (this.subject != null) {
      data['subject'] = this.subject!.toJson();
    }
    data['body'] = this.body;
    data['sentDate'] = this.sentDate;
    if (this.replyList != null) {
      data['replyList'] = this.replyList!.map((v) => v.toJson()).toList();
    }
    if (this.reply != null) {
      data['reply'] = this.reply!.toJson();
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
  int? studentCount;
  List<Null>? dBarList;
  List<Null>? allSubjects;
  List<Null>? dbarList;

  Grade(
      {this.boId,
        this.entityStatus,
        this.name,
        this.maximumStudentCount,
        this.createDate,
        this.note,
        this.subjectList,
        this.classList,
        this.studentCount,
        this.dBarList,
        this.allSubjects,
        this.dbarList});

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
    studentCount = json['studentCount'];
    // if (json['dBarList'] != null) {
    //   dBarList = <Null>[];
    //   json['dBarList'].forEach((v) {
    //     dBarList!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['allSubjects'] != null) {
    //   allSubjects = <Null>[];
    //   json['allSubjects'].forEach((v) {
    //     allSubjects!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['dbarList'] != null) {
    //   dbarList = <Null>[];
    //   json['dbarList'].forEach((v) {
    //     dbarList!.add(new Null.fromJson(v));
    //   });
    // }
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
    data['studentCount'] = this.studentCount;
    // if (this.dBarList != null) {
    //   data['dBarList'] = this.dBarList!.map((v) => v.toJson()).toList();
    // }
    // if (this.allSubjects != null) {
    //   data['allSubjects'] = this.allSubjects!.map((v) => v.toJson()).toList();
    // }
    // if (this.dbarList != null) {
    //   data['dbarList'] = this.dbarList!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class SubjectList {
  String? boId;
  String? entityStatus;
  String? name;
  String? gradeIds;
  String? subjectType;

  SubjectList(
      {this.boId,
        this.entityStatus,
        this.name,
        this.gradeIds,
        this.subjectType});

  SubjectList.fromJson(Map<String, dynamic> json) {
    boId = json['boId'];
    entityStatus = json['entityStatus'];
    name = json['name'];
    gradeIds = json['gradeIds'];
    subjectType = json['subjectType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['boId'] = this.boId;
    data['entityStatus'] = this.entityStatus;
    data['name'] = this.name;
    data['gradeIds'] = this.gradeIds;
    data['subjectType'] = this.subjectType;
    return data;
  }
}

class ClassList {
  String? boId;
  String? entityStatus;
  String? name;
  String? maximumStudentCount;
  Null? note;

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

class ReplyList {
  String? boId;
  String? entityStatus;
  ReplyUser? replyUser;
  String? replyDate;
  String? reply;

  ReplyList(
      {this.boId,
        this.entityStatus,
        this.replyUser,
        this.replyDate,
        this.reply});

  ReplyList.fromJson(Map<String, dynamic> json) {
    boId = json['boId'];
    entityStatus = json['entityStatus'];
    replyUser = json['replyUser'] != null
        ? new ReplyUser.fromJson(json['replyUser'])
        : null;
    replyDate = json['replyDate'];
    reply = json['reply'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['boId'] = this.boId;
    data['entityStatus'] = this.entityStatus;
    if (this.replyUser != null) {
      data['replyUser'] = this.replyUser!.toJson();
    }
    data['replyDate'] = this.replyDate;
    data['reply'] = this.reply;
    return data;
  }
}

class ReplyUser {
  String? boId;
  String? entityStatus;
  String? role;
  String? name;
  Null? image;
  String? phoneNo;
  Null? education;
  Null? email;
  Null? nrc;
  Null? dob;
  Null? gender;
  Null? religion;
  Null? nationality;
  Null? relationship;
  Null? workStatus;
  Null? department;
  Null? stateRegion;
  Null? city;
  Null? township;
  Null? address;
  Null? note;
  Null? roleType;
  Null? deviceToken;
  List<Null>? studentList;
  Null? job;
  List<Null>? subjectList;

  ReplyUser(
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
        this.deviceToken,
        this.studentList,
        this.job,
        this.subjectList});

  ReplyUser.fromJson(Map<String, dynamic> json) {
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
    deviceToken = json['deviceToken'];
    // if (json['studentList'] != null) {
    //   studentList = <Null>[];
    //   json['studentList'].forEach((v) {
    //     studentList!.add(new Null.fromJson(v));
    //   });
    // }
    job = json['job'];
    // if (json['subjectList'] != null) {
    //   subjectList = <Null>[];
    //   json['subjectList'].forEach((v) {
    //     subjectList!.add(new Null.fromJson(v));
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
    data['deviceToken'] = this.deviceToken;
    // if (this.studentList != null) {
    //   data['studentList'] = this.studentList!.map((v) => v.toJson()).toList();
    // }
    // data['job'] = this.job;
    // if (this.subjectList != null) {
    //   data['subjectList'] = this.subjectList!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}