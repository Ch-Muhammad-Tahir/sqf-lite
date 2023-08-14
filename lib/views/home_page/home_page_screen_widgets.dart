import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_project/providers/add_contact_provider.dart';
import 'package:sqflite_project/views/add_contacts_screen/add_contact_screen.dart';

class HomePageScreenWidgetSceen extends StatefulWidget {
  const HomePageScreenWidgetSceen({super.key});

  @override
  State<HomePageScreenWidgetSceen> createState() =>
      _HomePageScreenWidgetSceenState();
}

class _HomePageScreenWidgetSceenState extends State<HomePageScreenWidgetSceen> {
  @override
  void initState() {
    Provider.of<AddContactProvider>(context, listen: false)
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
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddContactScreenWidget()));
        },
        child: Text("Add"),
      ),
      body: Consumer<AddContactProvider>(
        builder: (BuildContext context, provider, child) {
          return ListView.builder(
              itemCount: provider.persons.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(provider.persons[index].personName),
                  subtitle: Text(provider.persons[index].contactNumber),
                  leading: Text(provider.persons[index].id.toString()),
                );
              });
        },
      ),
    );
  }
}
