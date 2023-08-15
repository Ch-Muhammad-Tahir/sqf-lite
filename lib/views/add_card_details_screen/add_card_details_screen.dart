import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:provider/provider.dart';

import '../../providers/add_card_provider.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({super.key});

  @override
  State<StatefulWidget> createState() {
    return CreditCardView();
  }
}

class CreditCardView extends State<CreditCard> {
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            CreditCardWidget(
              cardNumber:
                  Provider.of<AddCardDetailProvider>(context, listen: true)
                      .cardNumber,
              expiryDate:
                  Provider.of<AddCardDetailProvider>(context, listen: true)
                      .expiryDate,
              cardHolderName:
                  Provider.of<AddCardDetailProvider>(context, listen: true)
                      .cardHolderName,
              cvvCode: Provider.of<AddCardDetailProvider>(context, listen: true)
                  .cvvCode,
              bankName: 'Axis Bank',
              showBackView:
                  Provider.of<AddCardDetailProvider>(context, listen: true)
                      .isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
              isHolderNameVisible: true,
              cardBgColor: const Color.fromARGB(255, 2, 167, 243),
              isSwipeGestureEnabled: true,
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CreditCardForm(
                      formKey: formKey,
                      obscureCvv: true,
                      obscureNumber: false,
                      cardNumber: Provider.of<AddCardDetailProvider>(context,
                              listen: true)
                          .cardNumber,
                      cvvCode: Provider.of<AddCardDetailProvider>(context,
                              listen: true)
                          .cvvCode,
                      isHolderNameVisible: true,
                      isCardNumberVisible: true,
                      isExpiryDateVisible: true,
                      cardHolderName: Provider.of<AddCardDetailProvider>(
                              context,
                              listen: true)
                          .cardHolderName,
                      expiryDate: Provider.of<AddCardDetailProvider>(context,
                              listen: true)
                          .expiryDate,
                      themeColor: Colors.blue,
                      textColor: Colors.black,
                      cardNumberDecoration: InputDecoration(
                          labelText: 'Number',
                          hintText: 'XXXX XXXX XXXX XXXX',
                          hintStyle: const TextStyle(color: Colors.black),
                          labelStyle: const TextStyle(color: Colors.black),
                          focusedBorder: border,
                          enabledBorder: border,
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          )),
                      expiryDateDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.black),
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: border,
                        enabledBorder: border,
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        labelText: 'Expired Date',
                        hintText: 'XX/XX',
                      ),
                      cvvCodeDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.black),
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: border,
                        enabledBorder: border,
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                      cardHolderDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.black),
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'Card Holder',
                      ),
                      onCreditCardModelChange: onCreditCardModel,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Provider.of<AddCardDetailProvider>(context,
                                  listen: false)
                              .addDataInToDatabase();
                          Navigator.pop(context);
                        },
                        child: const Text("Add Card"))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onCreditCardModel(CreditCardModel? creditCardModel) {
    Provider.of<AddCardDetailProvider>(context, listen: false)
        .getDataFormScreen(creditCardModel);
  }
}
