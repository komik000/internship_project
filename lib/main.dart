import 'package:flutter/material.dart';
import '/pages/Post.dart';
import '/pages/gallery.dart';
import '/pages/profile.dart';
import '/pages/comments.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/gallery',
  routes: {
    '/home' : (context) => Post(),
    '/profile' : (context) => Profile(),
    '/gallery' : (context) => Gallery(),
    '/comments' : (context) => Comments(),
  },
));
