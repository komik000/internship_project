import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:aza/model/character_todos.dart';
import 'package:flutter_svg/svg.dart';
import '/data/character_api.dart';
import '/pages/Post.dart';



class Check extends StatefulWidget {
  const Check({Key? key}) : super(key: key);

  @override
  State<Check> createState() => _CheckState();
}

class _CheckState extends State<Check> {

  bool isChecked = false;

  final Post post = new Post();

  List<CharacterTodos> characterList = <CharacterTodos>[];

  void getCharactersfromApi() async {
    CharacterApi.getCharacters4().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        characterList =
            list.map((model) => CharacterTodos.fromJson(model)).toList();
      });
    });
  }
  @override
  void initState() {
    getCharactersfromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.focused,
      };
      // if (states.any(interactiveStates.contains)) {
      //   return Color(0xff6C63FF);
      // }
      return Color(0xff6C63FF);
    }
    return Container(

      child: Scaffold(
        backgroundColor: const Color(0xFF0F0B21),
        appBar: AppBar(
          title: Text('Check'),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color(0xff322C54), Color(0xff231D49),
                  ]),
            ),
          ),
        ),
        body: ListView.builder(
            shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            itemCount: characterList.length ,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Container(
                        color: characterList[index].completed ? Color(0xff322C54) : Color(0xFF0F0B21),
                        height: 64,
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.resolveWith(
                                  getColor),
                              value: characterList[index].completed,
                              onChanged: (bool? value) {
                                setState(() {
                                  characterList[index].completed = value!;
                                });
                              },
                            ),
                            SizedBox(width: 40,),
                            Text(
                              characterList[index].title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
        ),
        // bottomNavigationBar: _createBottomNavigationBar(),
      ),
    );
  }
  Widget _createBottomNavigationBar() {



    return Container(
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
        items: [
          BottomNavigationBarItem(
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
            icon: Column(
              children: [
                SvgPicture.asset("icons/heart.svg"),
                const Text('Check'),
              ],
            ),
            label : '',
          ),
          BottomNavigationBarItem(
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
    );
  }
}
