import 'package:aza/model/character_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';
import '/data/character_api.dart';

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
                padding: const EdgeInsets.all(6.0),
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('https://images.unsplash.com/photo-1574343062782-e0251cf2589c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmVhdXRpZnVsJTIwdHJlZXxlbnwwfHwwfHw%3D&w=1000&q=80')
                        ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child:  new Text("${characterList[index].title}", style: TextStyle(fontSize: 4.0,color:Colors.red,),),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ), onPressed: () {
          Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => const Title()),
          );
        },
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

class Title extends StatefulWidget {
  const Title({super.key});

  @override
  State<Title> createState() => _TitleState();
}

class _TitleState extends State<Title> {

  List<CharacterImage> characterList = <CharacterImage>[];

  void getCharactersfromApi() async {
    CharacterApi.getCharacters2().then((response) {
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
                                characterList[index].url,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 10.0,),
                            ],
                          ),
                          // const SizedBox(height: 16,),
                          Text(
                            characterList[index].title,
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

