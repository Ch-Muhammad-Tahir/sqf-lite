import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_project/models/person.dart';

import '../services/sqf_lite_database_manager.dart';

class AddContactProvider extends ChangeNotifier {
  List<Person> persons = [];
  late Person person;
  void getDataFormScreen(String name, String phone, String discritopn) {
    if (name.isEmpty) {}
    if (phone.isEmpty) {}
    if (discritopn.isEmpty) {
    } else {
      person = Person.addPeron(
          personName: name,
          personDiscrirpton: discritopn,
          contactNumber: phone);

      addDataInToDatabase(person);
      persons.add(person);
      notifyListeners();
    }

    print(person.toMap());
  }

  void getDataFromDatbase() async {
    persons = await DatabaseRepository.databaseInstance.getAllPersons();
    persons.forEach((element) {
      print(element.personName);
    });
    notifyListeners();
  }

  void addDataInToDatabase(Person person) async {
    DatabaseRepository.databaseInstance.insert(person: person);
  }
}
