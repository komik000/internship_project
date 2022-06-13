import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';
import '/data/character_api.dart';
import 'package:flutter/material.dart';
import 'package:aza/model/character_contacts.dart';
import '/pages/user.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {

  List<CharacterContacts> characterList = <CharacterContacts>[];

  void getCharactersfromApi() async {
    await CharacterApi.getCharacters5().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        characterList =
            list.map((model) => CharacterContacts.fromJson(model)).toList();
        print(characterList);
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
          title: const Text('Contacts'),
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
        body: CupertinoButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const User()),
            );
          },
          child: ListView.builder(
              itemCount: characterList.length ,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: const Color(0xFF0F0B21),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("icons/auth.svg"),
                          const SizedBox(width: 30.0,),
                          Text(
                           characterList[index].name,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16.0,),
                        ],
                      ),
                      // const SizedBox(height: 16,),

                    ],
                  ),
                ),
              );
            }
          ),
        ),
        // bottomNavigationBar: _createBottomNavigationBar(),
      ),
    );
  }

}
