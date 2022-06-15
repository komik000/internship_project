import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import '/data/character_api.dart';
import '/model/character.dart';
import '/pages/title1.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {

  List<Character> characterList = <Character>[];

  void getCharactersfromApi() async {
    CharacterApi.getCharacters1().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        characterList = list.map((model) => Character.fromJson(model)).toList();
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
    return Container(

      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff322C54), Color(0xff231D49),
          ],
        ),
      ),
        child: Scaffold(
          backgroundColor: const Color(0xFF0F0B21),

          appBar: AppBar(
            title: const Text('News'),
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

          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView.builder(
                itemCount: characterList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(height: 10,),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xB8342E5D),
                          ),
                          // color: const Color(0xB8342E5D),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  characterList[index].title,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: 'fonts/Raleway',
                                    color: Colors.white,
                                    letterSpacing: 1,

                                  ),
                                ),
                                SizedBox(height: 8,),
                                Text(
                                  characterList[index].body,
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: 'fonts/Raleway',
                                    color: Colors.white,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Title1()),
                        );
                      }
                      ),
                      index + 1 == characterList.length ? SizedBox(height: 10,) : Offstage()
                    ],
                  );
                },
            ),
          ),
          // bottomNavigationBar: _createBottomNavigationBar(),

        ),

    );

  }

}
