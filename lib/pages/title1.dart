import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';
import '../model/character_comments.dart';
import '/data/character_api.dart';

class Title1 extends StatefulWidget {
  const Title1({Key? key}) : super(key: key);

  @override
  State<Title1> createState() => _TitleState();
}

class _TitleState extends State<Title1> {

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
                  return Container(
                    padding: const EdgeInsets.fromLTRB(16,16,16,0),
                    child: Card(
                      color: const Color(0xFF312A5D),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16,16,16,6),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  child : Center(child: SvgPicture.asset('icons/auth.svg')),
                                  decoration: BoxDecoration(
                                    color: Colors.white38,
                                    borderRadius: BorderRadius.circular(999),
                                  ),
                                  height: 40,
                                  width: 40,
                                ),
                                const SizedBox(width: 16.0,),
                                Text(
                                  characterList[index].name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    letterSpacing: 1,
                                  ),
                                ),
                                // const SizedBox(height: 16.0,),
                              ],
                            ),
                            const SizedBox(height: 16,),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                characterList[index].body,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.5,
                                ),
                                // textAlign: TextAlign.left,
                              ),
                            ),
                            const SizedBox(height: 10.0,),
                          ],
                        ),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Show me',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 18.67,
                            ),
                          ),
                          SizedBox(width: 8,),
                          Text(
                            '${characterList.length} results',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18.67,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 180,),
                      SvgPicture.asset(
                        "icons/koz.svg",
                          width: 22.46,
                          height: 15.3,
                      ),
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

