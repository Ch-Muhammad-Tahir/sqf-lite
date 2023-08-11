class Person {
  int? id;
  String personName = "";
  String personDiscrirpton = "";
  String contactNumber = "";

  Person.fromJson(Map<String, dynamic> json) {
    if (json["personName"] != null &&
        (json["personName"] is String || json["personName"] is int)) {
      personName = json["personName"].toString();
    }
    if (json["personDiscrirpton"] != null &&
        (json["personDiscrirpton"] is String ||
            json["personDiscrirpton"] is int)) {
      personDiscrirpton = json["personDiscrirpton"].toString();
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
      "personDiscrirpton": personDiscrirpton,
      "contactNumber": contactNumber,
    };
    return result;
  }
}
