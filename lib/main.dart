import 'package:flutter/material.dart';
import '/pages/Post.dart';
import '/pages/title1.dart';
import '/pages/gallery.dart';
import '/pages/profile.dart';
import 'pages/check.dart';
import 'pages/contacts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async {
  await Hive.initFlutter();
  await Hive.openBox('check');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/profile',
    routes: {
      '/home': (context) => Post(),
      '/profile': (context) => Profile(),
      '/gallery': (context) => Gallery(),
      '/title': (context) => Title1(),
      '/check': (context) => Check(),
      '/contacts': (context) => Contacts(),
    },
  ));
}


