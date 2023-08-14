class CardModel {
  int? id;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  CardModel();
  CardModel.addCardDetails(
      {required this.cardHolderName,
      required this.expiryDate,
      required this.cardNumber,
      required this.cvvCode,
      required this.isCvvFocused});
  CardModel.fromJson(Map<String, dynamic> json) {
    if (json["cardNumber"] != null &&
        (json["cardNumber"] is String || json["cardNumber"] is int)) {
      cardNumber = json["cardNumber"].toString();
    }
    if (json["expiryDate"] != null &&
        (json["expiryDate"] is String || json["expiryDate"] is int)) {
      expiryDate = json["expiryDate"].toString();
    }
    if (json["cardHolderName"] != null &&
        (json["cardHolderName"] is String || json["cardHolderName"] is int)) {
      cardHolderName = json["cardHolderName"].toString();
    }
    if (json["isCvvFocused"] != null && (json["isCvvFocused"] is bool)) {
      isCvvFocused = json["isCvvFocused"];
    }
    if (json["id"] is int) {
      id = json["id"];
    }
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> result = {
      "id": id,
      "cardNumber": cardNumber,
      "expiryDate": expiryDate,
      "cardHolderName": cardHolderName,
      "isCvvFocused": isCvvFocused,
      "cvvCode": cvvCode,
    };
    return result;
  }
}
