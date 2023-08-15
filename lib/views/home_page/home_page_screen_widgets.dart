import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_project/models/card_model.dart';
import 'package:sqflite_project/providers/add_card_provider.dart';
import 'package:sqflite_project/views/add_card_details_screen/add_card_details_screen.dart';
import 'package:sqflite_project/views/home_page/home_page_widgets/home_page_top_bar.dart';
import 'package:sqflite_project/widgets/custom_text.dart';

class HomePageScreenWidgetSceen extends StatefulWidget {
  const HomePageScreenWidgetSceen({super.key});

  @override
  State<HomePageScreenWidgetSceen> createState() =>
      _HomePageScreenWidgetSceenState();
}

class _HomePageScreenWidgetSceenState extends State<HomePageScreenWidgetSceen> {
  @override
  void initState() {
    Provider.of<AddCardDetailProvider>(context, listen: false)
        .getDataFromDatbase();
    // TODO: implement initStatex`
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orange.shade100,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CreditCard()));
          },
          child: const Text("Add"),
        ),
        body: Column(
          children: [
            HomePageTopBar(),
            Expanded(
              child: Consumer<AddCardDetailProvider>(
                builder: (BuildContext context, provider, child) {
                  return ListView.builder(
                      itemCount: provider.cards.length,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onLongPress: () {
                            onLongTab(context, provider.cards[index]);
                          },
                          child: CreditCardWidget(
                            cardNumber: provider.cards[index].cardNumber,
                            expiryDate: provider.cards[index].expiryDate,
                            cardHolderName:
                                provider.cards[index].cardHolderName,
                            cvvCode: provider.cards[index].cvvCode,
                            bankName: 'Axis Bank',
                            showBackView: provider.cards[index].isCvvFocused,
                            obscureCardNumber: true,
                            obscureCardCvv: true,
                            isHolderNameVisible: true,
                            cardBgColor: const Color.fromARGB(255, 2, 167, 243),
                            isSwipeGestureEnabled: true,
                            onCreditCardWidgetChange:
                                (CreditCardBrand creditCardBrand) {},
                            customCardTypeIcons: <CustomCardTypeIcon>[
                              CustomCardTypeIcon(
                                cardType: CardType.mastercard,
                                cardImage: Image.asset(
                                  'assets/images.png',
                                  height: 48,
                                  width: 48,
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onLongTab(BuildContext context, CardModel cardModel) {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Card'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are Your realiy want To Delete The Card '),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                Provider.of<AddCardDetailProvider>(context, listen: false)
                    .deteteDataFromDatabase(cardModel);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
