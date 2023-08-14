import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_project/providers/add_contact_provider.dart';

class AddContactScreenWidget extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController discriprionController = TextEditingController();
  AddContactScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Contact")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  hintText: "Enter Name",
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.black,
                  )),
            ),
            TextField(
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    hintText: "Enter Number",
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ))),
            TextField(
                controller: discriprionController,
                decoration: const InputDecoration(
                    hintText: "Enter Discription",
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ))),
            ElevatedButton(
                onPressed: () {
                  onTab(context);
                  Navigator.pop(context);
                },
                child: Text("Add ")),
            ElevatedButton(
                onPressed: () {
                  Provider.of<AddContactProvider>(context, listen: false)
                      .getDataFromDatbase();
                },
                child: Text("Show"))
          ],
        ),
      ),
    );
  }

  void onTab(BuildContext context) async {
    String name = nameController.text.toString();
    String number = phoneNumberController.text.toString();
    String discription = discriprionController.text.toString();

    Provider.of<AddContactProvider>(context, listen: false)
        .getDataFormScreen(name, number, discription);
  }
}
