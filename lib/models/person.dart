class Person {
  int? id;
  String personName = "";
  String personDiscrirpton = "";
  String contactNumber = "";
  Person();
  Person.addPeron(
      {required this.personName,
      required this.personDiscrirpton,
      required this.contactNumber});
  Person.fromJson(Map<String, dynamic> json) {
    if (json["personName"] != null &&
        (json["personName"] is String || json["personName"] is int)) {
      personName = json["personName"].toString();
    }
    if (json["description"] != null &&
        (json["description"] is String || json["description"] is int)) {
      personDiscrirpton = json["description"].toString();
    }
    if (json["contactNumber"] != null &&
        (json["contactNumber"] is String || json["contactNumber"] is int)) {
      contactNumber = json["contactNumber"].toString();
    }
    if (json["id"] is int) {
      id = json["id"];
    }
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> result = {
      "id": id,
      "personName": personName,
      "description": personDiscrirpton,
      "contactNumber": contactNumber,
    };
    return result;
  }
}
