import 'package:fitlifebuddy/domain/model/person.dart';
import 'package:get/get.dart';

class PersonService {
  final currentPerson = Person().obs;

  void setPerson(Person person) {
    currentPerson.value = person;
  }
}