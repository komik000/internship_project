import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:aza/model/character_todos.dart';
import 'package:flutter_svg/svg.dart';
import '/data/character_api.dart';
import '/pages/Post.dart';
import 'package:hive/hive.dart';




class Check extends StatefulWidget {
  const Check({Key? key}) : super(key: key);

  @override
  State<Check> createState() => _CheckState();
}

class _CheckState extends State<Check> {

  bool isChecked = false;
  var box = Hive.box('check');

  final Post post = new Post();
  List<bool> checkbox = [];
  List<CharacterTodos> characterList = <CharacterTodos>[];

  void getCharactersfromApi() async {
    CharacterApi.getCharacters4().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        characterList = list.map((model) => CharacterTodos.fromJson(model)).toList();
        for(int i=0;i<characterList.length;i++){
          checkbox.add(characterList[i].completed);
        }
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
                      padding: EdgeInsets.fromLTRB(16, (index == 0 ? 16 : 0), 16, 0),
                      child: Container(
                        color: (box.get('list_of_check') != null ? box.get('list_of_check')[index] : checkbox[index]) ? Color(0xff322C54) : Color(0xFF0F0B21),
                        height: 64,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Transform.scale(
                                scale: 1.3,
                                child: Checkbox(
                                  checkColor: Color(0xFF0F0B21),
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: box.get('list_of_check') != null ? box.get('list_of_check')[index] : checkbox[index],
                                  splashRadius: 30,
                                  onChanged: (bool? value) {
                                    // box.put(index,characterList);
                                    setState(() {
                                      checkbox[index] = value!;
                                      box.put('list_of_check', checkbox);
                                    });
                                  },
                                ),
                              ),

                              SizedBox(width: 46.33,),
                              Text(
                                characterList[index].title.length > 30 ? 'very long text' : characterList[index].title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ],
                          ),
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
