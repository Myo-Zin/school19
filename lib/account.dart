import 'dart:convert';

class Account {
  String? userId;
  String? token;

  Account(this.userId, this.token);

  Map<String, dynamic> toMap() {
    return {'userId': userId, 'token': token};
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      map['userId'],
      map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source));
}
