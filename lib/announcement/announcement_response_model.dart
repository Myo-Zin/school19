

class AnnouncementResponse {
  bool? status;
  String? message;
  List<AnnouncementList>? announcementList;

  AnnouncementResponse({this.status, this.message, this.announcementList});

  AnnouncementResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['announcementList'] != null) {
      announcementList = <AnnouncementList>[];
      json['announcementList'].forEach((v) {
        announcementList!.add(AnnouncementList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (announcementList != null) {
      data['announcementList'] =
          announcementList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AnnouncementList {
  String? boId;
  String? entityStatus;
  String? title;
  String? body;
  String? openDate;
  String? closeDate;
  String? createDate;
  String? modifiedDate;
  String? announcementType;

  AnnouncementList(
      {this.boId,
        this.entityStatus,
        this.title,
        this.body,
        this.openDate,
        this.closeDate,
        this.createDate,
        this.modifiedDate,
        this.announcementType});

  AnnouncementList.fromJson(Map<String, dynamic> json) {
    boId = json['boId'];
    entityStatus = json['entityStatus'];
    title = json['title'];
    body = json['body'];
    openDate = json['openDate'];
    closeDate = json['closeDate'];
    createDate = json['createDate'];
    modifiedDate = json['modifiedDate'];
    announcementType = json['announcementType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['boId'] = this.boId;
    data['entityStatus'] = this.entityStatus;
    data['title'] = this.title;
    data['body'] = this.body;
    data['openDate'] = this.openDate;
    data['closeDate'] = this.closeDate;
    data['createDate'] = this.createDate;
    data['modifiedDate'] = this.modifiedDate;
    data['announcementType'] = this.announcementType;
    return data;
  }
}