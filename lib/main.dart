import 'package:flutter/material.dart';
import '/pages/Post.dart';
import '/pages/gallery.dart';
import '/pages/profile.dart';
import '/pages/user.dart';
import 'pages/check.dart';
import 'pages/contacts.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/profile',
  routes: {
    '/home' : (context) => Post(),
    '/profile' : (context) => Profile(),
    '/gallery' : (context) => Gallery(),
    '/user' : (context) => User(),
    '/check' : (context) => Check(),
    '/contacts' : (context) => Contacts(),
  },
));
