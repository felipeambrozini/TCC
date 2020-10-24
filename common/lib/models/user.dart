import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class BatUser {
  String userId;
  String name;
  String email;

  BatUser({this.userId, this.name, this.email});

  factory BatUser.fromDocument(DocumentSnapshot document) {
    return BatUser.fromMap(document.data);
  }

  factory BatUser.fromJson(String str) => BatUser.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BatUser.fromMap(Map<String, dynamic> json) => BatUser(
      userId: json["userID"] == null ? null : json["userID"],
      name: json["name"] == null ? null : json["name"],
      email: json["email"] == null ? null : json["email"]);

  Map<String, dynamic> toMap() => {
        "userID": userId == null ? null : userId,
        "name": name == null ? null : name,
        "email": email == null ? null : email
      };
}
