import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import '../model/character_image.dart';
import '/data/character_api.dart';


class Title2 extends StatefulWidget {
  const Title2({Key? key}) : super(key: key);

  @override
  State<Title2> createState() => _Title2State();
}

class _Title2State extends State<Title2> {

  List<CharacterImage> characterList = <CharacterImage>[];

  void getCharactersfromApi() async {
    CharacterApi.getCharacters3().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        characterList = list.map((model) => CharacterImage.fromJson(model)).toList();
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
        body: Container(
            child : GridView.count(
            crossAxisCount: 3,

            children: List.generate(characterList.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://images.unsplash.com/photo-1574343062782-e0251cf2589c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmVhdXRpZnVsJTIwdHJlZXxlbnwwfHwwfHw%3D&w=1000&q=80'),
                        fit: BoxFit.cover,
                      ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            new Text("Card title here", style: TextStyle(fontSize: 14.0,color:Colors.white,),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),

      ),
    );
  }
}
