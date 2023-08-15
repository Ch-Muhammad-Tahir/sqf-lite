import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_project/providers/add_card_provider.dart';
import 'package:sqflite_project/views/add_card_details_screen/add_card_details_screen.dart';
import 'package:sqflite_project/views/home_page/home_page_screen_widgets.dart';

void main(List<String> args) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AddCardDetailProvider>(
          create: (context) => AddCardDetailProvider()),
    ],
    child: const MaterialApp(
      home: HomePageScreenWidgetSceen(),
    ),
  ));
}
