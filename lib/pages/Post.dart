import 'package:aza/model/character_comments.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';
import '/data/character_api.dart';
import '/model/character.dart';

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

          body:CupertinoButton(
            child : ListView.builder(
              itemCount: characterList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(

                    color: const Color(0xB8342E5D),
                    child: ListTile(
                      title: Column(
                        children: [
                          Text(
                              characterList[index].title,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'fonts/Raleway',
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8,),
                        ],
                      ),
                      subtitle: Text(
                          characterList[index].body,
                        style: const TextStyle(
                          fontFamily: 'fonts/Raleway',
                          color: Colors.white,
                      ),
                      ),
                    ),
                  ),
                );
              },
          ), onPressed: () {
            Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => const Title()),
            );
          },
          ),
          bottomNavigationBar: _createBottomNavigationBar(),

        ),

    );
    // ListView.builder(
    // itemCount: characterList.length,
    // itemBuilder: (context, index) {
    // return ListTile(
    // title: Text(characterList[index].title),
    // subtitle: Text(characterList[index].body),
    // );
    // }),

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

class Title extends StatefulWidget {
  const Title({super.key});

  @override
  State<Title> createState() => _TitleState();
}

class _TitleState extends State<Title> {

  List<CharacterComment> characterList = <CharacterComment>[];

  void getCharactersfromApi() async {
    CharacterApi.getCharacters2().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        characterList = list.map((model) => CharacterComment.fromJson(model)).toList();
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
          title: const Text('Title'),
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
        body:Stack(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: characterList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      color: const Color(0xFF312A5D),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset("icons/IconsButton.svg"),
                              const SizedBox(width: 10.0,),
                              Text(
                                characterList[index].email,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 10.0,),
                            ],
                          ),
                          // const SizedBox(height: 16,),
                          Text(
                            characterList[index].name,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10.0,),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  height: 64,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xff6C63FF),
                  child: Row(
                    children: [
                      SizedBox(width: 24,),
                      Text(
                        'Show me',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(width: 80,),
                      Text(
                        '${characterList.length} results',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(width: 180,),
                      SvgPicture.asset("icons/koz.svg"),
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}

