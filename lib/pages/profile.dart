import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '/pages/Post.dart';
import '/pages/gallery.dart';
import '/pages/contacts.dart';
import '/pages/check.dart';

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

  int _selectedIndex = 0;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,16,0,0),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            onTap: onTapped,
            currentIndex: currentTabIndex,
            // selectedItemColor: Colors.amber[800],
            items: [
              BottomNavigationBarItem(
                // backgroundColor: currentTabIndex == 1 ? colors[0] : colors[1],
                icon: Column(
                  children: [
                    SvgPicture.asset("icons/home.svg",height: 12.75,width: 15,),
                    const Text(
                      'News',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                activeIcon: Column(
                  children: [
                    SvgPicture.asset("icons/home.svg",height: 12.75,width: 15,color: Colors.blue,),
                    const Text(
                      'News',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                label : '',
              ),
              BottomNavigationBarItem(
                backgroundColor: currentTabIndex == 2 ? colors[0] : colors[1],
                icon: Column(
                  children: [
                    SvgPicture.asset("icons/Vector.svg",height: 15,width: 12,),

                    const Text(
                      'Gallery',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                activeIcon: Column(
                  children: [
                    SvgPicture.asset(
                      ("icons/Vector.svg"),
                      color: Colors.blue,
                    ),
                    const Text(
                      'Gallery',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                label : '',
              ),
              BottomNavigationBarItem(
                backgroundColor: currentTabIndex == 3 ? colors[0] : colors[1],
                icon: Column(
                  children: [
                    SvgPicture.asset("icons/heart.svg",height: 15,width: 13.76,),
                    const Text(
                      'Check',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                activeIcon: Column(
                  children: [
                    SvgPicture.asset("icons/heart.svg",height: 15,width: 13.76,color: Colors.blue),
                    const Text(
                      'Check',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                label : '',
              ),
              BottomNavigationBarItem(
                  backgroundColor: currentTabIndex == 4 ? colors[0] : colors[1],
                icon: Column(
                  children: [
                    SvgPicture.asset("icons/heart.svg",height: 15,width: 13.76,),
                    const Text(
                      'Contacts',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                activeIcon: Column(
                  children: [
                    SvgPicture.asset("icons/heart.svg",height: 15,width: 13.76,color: Colors.blue),
                    const Text(
                      'Contacts',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                label : '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
