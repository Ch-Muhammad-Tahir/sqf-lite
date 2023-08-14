import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_project/providers/add_card_provider.dart';
import 'package:sqflite_project/views/add_card_details_screen/add_contact_screen.dart';

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
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SQFLite")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CreditCard()));
        },
        child: Text("Add"),
      ),
      body: Consumer<AddCardDetailProvider>(
        builder: (BuildContext context, provider, child) {
          return ListView.builder(
              itemCount: provider.cards.length,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CreditCardWidget(
                  cardNumber: provider.cards[index].cardNumber,
                  expiryDate: provider.cards[index].expiryDate,
                  cardHolderName: provider.cards[index].cardHolderName,
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
                );
                // ListTile(
                //   title: Text(provider.cards[index].cardHolderName),
                //   subtitle: Text(provider.cards[index].cardHolderName),
                //   leading: Text(provider.cards[index].id.toString()),
                // );
              });
        },
      ),
    );
  }
}
