import 'dart:convert';

class Person {
  int? id;
  String? fullname;
  String? lastname;
  String? emailAddress;
  String? password;
  bool? acceptNotifications;

  Person({
    this.id,
    this.fullname,
    this.lastname,
    this.emailAddress,
    this.password,
    this.acceptNotifications,
  });

  Map<String, dynamic> toMap() {
    return {
      'idPerson': id,
      'fullname': fullname,
      'lastname': lastname,
      'emailAddress': emailAddress,
      'password': password,
      'acceptsNotifications': acceptNotifications,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      id: map['idPerson'] != null ? map['idPerson'] as int : null,
      fullname: map['fullname'] != null ? map['fullname'] as String : null,
      lastname: map['lastname'] != null ? map['lastname'] as String : null,
      emailAddress: map['emailAddress'] != null ? map['emailAddress'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      acceptNotifications: map['acceptsNotifications'] != null ? map['acceptsNotifications'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) =>
      Person.fromMap(json.decode(source) as Map<String, dynamic>);
}
