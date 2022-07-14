
class LoginResponse {
  bool? status;
  String? message;
  String? token;
  User? user;

  LoginResponse({this.status, this.message, this.token, this.user});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['token'] = this.token;
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
        this.job,});

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
        studentList!.add(StudentList.fromJson(v));
      });
    }
    job = json['job'];
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
    if (studentList != null) {
      data['studentList'] = this.studentList!.map((v) => v.toJson()).toList();
    }
    data['job'] = this.job;
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
 // StudentInfo? studentInfo;
  String? status;

  StudentList(
      {this.boId,
        this.entityStatus,
        this.studentName,
        this.gender,
        this.dob,
        this.school,
       // this.studentInfo,
        this.status});

  StudentList.fromJson(Map<String, dynamic> json) {
    boId = json['boId'];
    entityStatus = json['entityStatus'];
    studentName = json['studentName'];
    gender = json['gender'];
    dob = json['dob'];
    school = json['school'];
    // studentInfo = json['studentInfo'] != null
    //     ? StudentInfo.fromJson(json['studentInfo'])
    //     : null;
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
    // if (this.studentInfo != null) {
    //   data['studentInfo'] = this.studentInfo!.toJson();
    // }
    data['status'] = this.status;
    return data;
  }
}

