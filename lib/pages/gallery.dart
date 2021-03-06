import 'package:aza/model/character_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';
import '/data/character_api.dart';
import '/pages/title2.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {

  List<CharacterImage> characterList = <CharacterImage>[];

  void getCharactersfromApi() async {
    await CharacterApi.getCharacters3().then((response) {
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
          title: const Text('Gallery'),
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
          child : GridView.count(
            crossAxisCount: 2,

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
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            new Text("Card title here", style: TextStyle(fontSize: 14.0,color:Colors.white,),),
                            new Text("${characterList[index].title}", style: TextStyle(fontSize: 12.0,color:Colors.white,),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ), onPressed: () {
          Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => Title2()),
          );
        },
        ),
        // bottomNavigationBar: _createBottomNavigationBar(),

      ),

    );

  }
}
