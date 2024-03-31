import 'dart:convert';

class Person {
  String? id;
  String? fullname;
  String? lastname;
  String? emailAddress;
  String? password;

  Person({
    this.id,
    this.fullname,
    this.lastname,
    this.emailAddress,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullname': fullname,
      'lastname': lastname,
      'emailAddress': emailAddress,
      'password': password,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      id: map['id'] != null ? map['id'] as String : null,
      fullname: map['fullname'] != null ? map['fullname'] as String : null,
      lastname: map['lastname'] != null ? map['lastname'] as String : null,
      emailAddress: map['emailAddress'] != null ? map['emailAddress'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) =>
      Person.fromMap(json.decode(source) as Map<String, dynamic>);
}