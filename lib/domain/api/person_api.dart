import 'dart:convert';

import 'package:fitlifebuddy/domain/api/base_api.dart';
import 'package:fitlifebuddy/domain/model/person.dart';
import 'package:get/get.dart';

class PersonApi {
  final _apiBase = Get.find<BaseApi>();

  // Get Persons
  Future<List<Person>> getPersons() async {
    final response = await _apiBase.get('persons');
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((i) => Person.fromMap(i)).toList();
  }

  // Get Person by Id
  Future<Person> getPersonById(int id) async {
    final response = await _apiBase.get('persons/$id');
    return Person.fromJson(response.body);
  }

  // Create Person
  Future<Person> createPerson(Person person) async {
    final response = await _apiBase.post('persons', body: person.toJson());
    return Person.fromJson(response.body);
  }

  // Update Person
  Future<Person> updatePerson(int id, Person person) async {
    final response = await _apiBase.put('persons/$id', body: person.toJson());
    return Person.fromJson(response.body);
  }

  // Delete Person
  Future<void> deletePerson(int id) async {
    await _apiBase.delete('persons/$id');
  }

  // Get Person by EmailAddress
  Future<Person?> getPersonByEmailAddress(String emailAddress) async {
    final response = await _apiBase.get('persons/searchByEmailAddress/$emailAddress');
    final List<dynamic> jsonData = json.decode(response.body);
    return Person.fromMap(jsonData.first as Map<String, dynamic>); //TODO: revertir a retornar una lista
  }

  // Get Persons by FullName
  Future<List<Person>> getPersonsByFullName(String fullname) async {
    final response = await _apiBase.get('persons/searchByFullName/$fullname');
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((i) => Person.fromMap(i)).toList();
  }

  // Get Persons by LastName
  Future<List<Person>> getPersonsByLastName(String lastname) async {
    final response = await _apiBase.get('persons/searchByLastName/$lastname');
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((i) => Person.fromMap(i)).toList();
  }
}