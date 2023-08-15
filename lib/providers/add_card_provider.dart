import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:sqflite_project/models/card_model.dart';

import '../services/sqf_lite_database_manager.dart';

class AddCardDetailProvider extends ChangeNotifier {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  List<CardModel> cards = [];
  late CardModel cardModel;
  void getDataFormScreen(CreditCardModel? cardModel) {
    cardNumber = cardModel!.cardNumber;
    expiryDate = cardModel.expiryDate;
    cardHolderName = cardModel.cardHolderName;
    cvvCode = cardModel.cvvCode;
    isCvvFocused = cardModel.isCvvFocused;
    notifyListeners();
  }

  void getDataFromDatbase() async {
    cards = await DatabaseRepository.databaseInstance.getAllPersons();
    cards.forEach((element) {
      print(element.cardHolderName);
    });
    notifyListeners();
  }

  void addDataInToDatabase() async {
    cardModel = CardModel.addCardDetails(
        cardNumber: cardNumber,
        cardHolderName: cardHolderName,
        expiryDate: expiryDate,
        cvvCode: cvvCode,
        isCvvFocused: isCvvFocused);
    int id =
        await DatabaseRepository.databaseInstance.insert(cardModel: cardModel);
    if (id != 0) {
      cardModel.id = id;
      cards.add(cardModel);
      print("Perosn ${cardModel.toMap()}");
      notifyListeners();
    }
  }

  void deteteDataFromDatabase(CardModel card) async {
    await DatabaseRepository.databaseInstance.delete(card.id!);
    cards.remove(card);
    notifyListeners();
  }
}
