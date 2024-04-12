import 'dart:convert';

class Person {
  int? id;
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
    return {
      'idPerson': id,
      'fullname': fullname,
      'lastname': lastname,
      'emailAddress': emailAddress,
      'password': password,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      id: map['idPerson'] as int?,
      fullname: map['fullname'] as String?,
      lastname: map['lastname'] as String?,
      emailAddress: map['emailAddress'] as String?,
      password: map['password'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) =>
      Person.fromMap(json.decode(source) as Map<String, dynamic>);
}
