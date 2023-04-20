import 'package:flutter/widgets.dart';

class UserDBModel {
  @required
  String? id;
  @required
  String? firstName;
  @required
  String? lastName;
  @required
  String? email;
  @required
  String? active;
  @required
  String? whether;

  UserDBModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.active,
      this.whether});

  UserDBModel.fromDb(Map<String, dynamic> map)
      : id = map['id'],
        firstName = map['firstName'],
        lastName = map['lastName'],
        email = map['email'],
        active = map['active'],
        whether = map['whether'];

  Map<String, dynamic> toMapForDb() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['active'] = active;
    map['whether'] = whether;
    return map;
  }

  UserDBModel.random(
      String this.id,
      String this.firstName,
      String this.lastName,
      String this.email,
      String this.active,
      String this.whether);
}
