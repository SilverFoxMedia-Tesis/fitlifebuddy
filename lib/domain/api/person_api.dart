import 'dart:convert';

import 'package:fitlifebuddy/domain/api/base_api.dart';
import 'package:fitlifebuddy/domain/model/person.dart';
import 'package:get/get.dart';

class PersonApi {
  final _apiBase = Get.find<BaseApi>();

  // Get Persons
  Future<List<Person>> getPersons() async {
    final response = await _apiBase.get('persons');
    return (json.decode(response.body) as List).map((i) => Person.fromJson(i)).toList();
  }

  // Get Person by Id
  Future<Person> getPersonById(int id) async {
    final response = await _apiBase.get('persons/$id');
    return Person.fromJson(response.body);
  }

  // Create Person
  Future<Person> createPerson(Person person) async {
    final response = await _apiBase.post('persons', body: person.toJson());
    return Person.fromJson(json.decode(response.body));
  }

  // Update Person
  Future<Person> updatePerson(int id, Person person) async {
    final response = await _apiBase.put('persons/$id', body: person.toJson());
    return Person.fromJson(json.decode(response.body));
  }

  // Delete Person
  Future<void> deletePerson(int id) async {
    await _apiBase.delete('persons/$id');
  }

  // Get Persons by EmailAddress
  Future<List<Person>> getPersonsByEmailAddress(String emailAddress) async {
    final response = await _apiBase.get('persons/searchByEmailAddress/$emailAddress');
    return (json.decode(response.body) as List).map((i) => Person.fromJson(i)).toList();
  }

  // Get Persons by FullName
  Future<List<Person>> getPersonsByFullName(String fullname) async {
    final response = await _apiBase.get('persons/searchByFullName/$fullname');
    return (json.decode(response.body) as List).map((i) => Person.fromJson(i)).toList();
  }

  // Get Persons by LastName
  Future<List<Person>> getPersonsByLastName(String lastname) async {
    final response = await _apiBase.get('persons/searchByLastName/$lastname');
    return (json.decode(response.body) as List).map((i) => Person.fromJson(i)).toList();
  }
}