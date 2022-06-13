import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '/pages/Post.dart';
import '/pages/gallery.dart';
import '/pages/contacts.dart';
import '/pages/check.dart';
import 'dart:convert';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  int currentTabIndex = 0;
  List<Widget> tabs = [
    Post(),
    Gallery(),
    Check(),
    Contacts(),
  ];
  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }
  List<Color> colors = [
    Colors.white,
    Colors.white10,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentTabIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff322C54), Color(0xff231D49)],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            stops: [0.0, 0.8],
            tileMode: TileMode.clamp,
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          onTap: onTapped,
          currentIndex: currentTabIndex,
          items: [
            BottomNavigationBarItem(
              // backgroundColor: currentTabIndex == 1 ? colors[0] : colors[1],
              icon: Column(
                children: [
                  SvgPicture.asset("icons/home.svg"),
                  const Text(
                    'News',
                  ),
                ],
              ),
              label : '',
            ),
            BottomNavigationBarItem(
              backgroundColor: currentTabIndex == 2 ? colors[0] : colors[1],
              icon: Column(
                children: [
                  SvgPicture.asset("icons/Vector.svg"),
                  const Text(
                    'Gallery',
                  ),
                ],
              ),
              label : '',
            ),
            BottomNavigationBarItem(
              backgroundColor: currentTabIndex == 3 ? colors[0] : colors[1],
              icon: Column(
                children: [
                  SvgPicture.asset("icons/heart.svg"),
                  const Text('Check'),
                ],
              ),
              label : '',
            ),
            BottomNavigationBarItem(
                backgroundColor: currentTabIndex == 4 ? colors[0] : colors[1],
              icon: Column(
                children: [
                  SvgPicture.asset("icons/heart.svg"),
                  const Text('Contacts'),
                ],
              ),
              label : '',
            ),
          ],
        ),
      ),
    );
  }
}
