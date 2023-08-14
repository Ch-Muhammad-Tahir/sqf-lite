import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_project/providers/add_contact_provider.dart';
import 'package:sqflite_project/views/home_page/home_page_screen_widgets.dart';

void main(List<String> args) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AddContactProvider>(
          create: (context) => AddContactProvider()),
    ],
    child: MaterialApp(
      home: const HomePageScreenWidgetSceen(),
    ),
  ));
}
