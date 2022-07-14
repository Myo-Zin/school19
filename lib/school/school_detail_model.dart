class SchoolResponse {
  bool? status;
  String? message;
  School? school;

  SchoolResponse({this.status, this.message, this.school});

  SchoolResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    school =
    json['school'] != null ? School.fromJson(json['school']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (this.school != null) {
      data['school'] = this.school!.toJson();
    }
    return data;
  }
}

class School {
  String? boId;
  String? entityStatus;
  String? name;
  String? level;
  String? image;
  String? contactPhone1;
  String? contactPhone2;
  String? email;
  String? facebook;
  String? website;
  String? address;
  String? note;
  Null? tenantId;
  String? percent;
  Null? token;
  Null? openDate;
  Null? schoolStatus;
  StateRegion? stateRegion;
  City? city;
  Null? township;
  Null? cityId;
  Null? stateRegionId;

  School(
      {this.boId,
        this.entityStatus,
        this.name,
        this.level,
        this.image,
        this.contactPhone1,
        this.contactPhone2,
        this.email,
        this.facebook,
        this.website,
        this.address,
        this.note,
        this.tenantId,
        this.percent,
        this.token,
        this.openDate,
        this.schoolStatus,
        this.stateRegion,
        this.city,
        this.township,
        this.cityId,
        this.stateRegionId});

  School.fromJson(Map<String, dynamic> json) {
    boId = json['boId'];
    entityStatus = json['entityStatus'];
    name = json['name'];
    level = json['level'];
    image = json['image'];
    contactPhone1 = json['contactPhone1'];
    contactPhone2 = json['contactPhone2'];
    email = json['email'];
    facebook = json['facebook'];
    website = json['website'];
    address = json['address'];
    note = json['note'];
    tenantId = json['tenantId'];
    percent = json['percent'];
    token = json['token'];
    openDate = json['openDate'];
    schoolStatus = json['schoolStatus'];
    stateRegion = json['stateRegion'] != null
        ? new StateRegion.fromJson(json['stateRegion'])
        : null;
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    township = json['township'];
    cityId = json['cityId'];
    stateRegionId = json['stateRegionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['boId'] = this.boId;
    data['entityStatus'] = this.entityStatus;
    data['name'] = this.name;
    data['level'] = this.level;
    data['image'] = this.image;
    data['contactPhone1'] = this.contactPhone1;
    data['contactPhone2'] = this.contactPhone2;
    data['email'] = this.email;
    data['facebook'] = this.facebook;
    data['website'] = this.website;
    data['address'] = this.address;
    data['note'] = this.note;
    data['tenantId'] = this.tenantId;
    data['percent'] = this.percent;
    data['token'] = this.token;
    data['openDate'] = this.openDate;
    data['schoolStatus'] = this.schoolStatus;
    if (this.stateRegion != null) {
      data['stateRegion'] = this.stateRegion!.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    data['township'] = this.township;
    data['cityId'] = this.cityId;
    data['stateRegionId'] = this.stateRegionId;
    return data;
  }
}

class StateRegion {
  String? boId;
  String? entityStatus;
  String? name;
  List<Null>? cityList;

  StateRegion({this.boId, this.entityStatus, this.name, this.cityList});

  StateRegion.fromJson(Map<String, dynamic> json) {
    boId = json['boId'];
    entityStatus = json['entityStatus'];
    name = json['name'];
    // if (json['cityList'] != null) {
    //   cityList = <Null>[];
    //   json['cityList'].forEach((v) {
    //     cityList!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['boId'] = this.boId;
    data['entityStatus'] = this.entityStatus;
    data['name'] = this.name;
    // if (this.cityList != null) {
    //   data['cityList'] = this.cityList!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class City {
  String? boId;
  String? entityStatus;
  String? name;

  City({this.boId, this.entityStatus, this.name});

  City.fromJson(Map<String, dynamic> json) {
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