import 'dart:convert';

class Students {
  List<Map<String, String>> people;

  Students(this.people);

  void sort(String field) {
    people.sort((a, b) => a[field]!.compareTo(b[field]!));
  }

  void output() {
    for (var person in people) {
      print(person);
    }
  }

  void plus(Map<String, String> person) {
    people.add(person);
  }

  void remove(String field, String value) {
    people.removeWhere((person) => person[field] == value);
  }
}

void main() {
  String json = '''
  [
    {"first":"Steve", "last":"Griffith", "email":"griffis@algonquincollege.com"},
    {"first":"Adesh", "last":"Shah", "email":"shaha@algonquincollege.com"},
    {"first":"Tony", "last":"Davidson", "email":"davidst@algonquincollege.com"},
    {"first":"Adam", "last":"Robillard", "email":"robilla@algonquincollege.com"}
  ]
  ''';

  List<dynamic> jsonData = jsonDecode(json);
  List<Map<String, String>> people = jsonData.map((item) {
    return Map<String, String>.from(item);
  }).toList();

  Students students = Students(people);

  print("After sorting by first name:");
  students.sort('first');
  students.output();



  // adding a new person

  print("\nAfter adding a new person:");
  students.plus({"first": "Nafis", "last": "Farhan", "email": "nafis@abc.com"});
  students.output();

  // removing a person


  print("\nAfter removing a person with the email field:");
  students.remove('email', 'nafis@abc.com');
  students.output();
}
