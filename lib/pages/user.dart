import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aza/model/character_contacts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class User extends StatefulWidget {
  final CharacterContacts characterContacts;

  const User({Key? key, required this.characterContacts,}) : super(key: key);

  @override
  State<User> createState() => _UserState();

}

class _UserState extends State<User> {

  @override
  void initState() {
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
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 26, 0, 5),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      height: 70,
                      width: 70,
                      child: Center(child:
                      SvgPicture.asset(
                        'icons/auth.svg',
                        height: 28,
                        fit: BoxFit.scaleDown,
                      ),
                      ),
                    ),
                  ),
                ),
                Text(widget.characterContacts.name, style: TextStyle(
                    color: Colors.white, fontSize: 16, letterSpacing: 1),),
                TextButton(onPressed: null,
                  child: Text(
                    widget.characterContacts.username,
                    style: TextStyle(color: Color(0xff6C63FF),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  child: TextField(
                    obscureText: true,
                    autofocus: false,
                    readOnly: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white38,
                            width: 0.5),
                      ),
                      border: OutlineInputBorder(),
                      label: Container(
                        child: Text(
                          'E-mail',
                          style: TextStyle(
                            color: Colors.white38,
                          ),
                        ),
                      ),
                      hintText: widget.characterContacts.email,
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  child: TextField(
                    obscureText: true,
                    autofocus: false,
                    readOnly: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white38,
                            width: 0.5),
                      ),
                      border: OutlineInputBorder(),
                      label: Container(
                        child: Text(
                          'Phone Number',
                          style: TextStyle(
                            color: Colors.white38,
                          ),
                        ),
                      ),
                      hintText: widget.characterContacts.phone,
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  child: TextField(
                    obscureText: true,
                    autofocus: false,
                    readOnly: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white38,
                            width: 0.5),
                      ),
                      border: OutlineInputBorder(),
                      label: Container(
                        child: Text(
                          'Website',
                          style: TextStyle(
                            color: Colors.white38,
                          ),
                        ),
                      ),
                      hintText: widget.characterContacts.website,
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  child: TextField(
                    obscureText: true,
                    autofocus: false,
                    readOnly: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white38,
                            width: 0.5),
                      ),
                      border: OutlineInputBorder(),
                      label: Container(
                        child: Text(
                          'Company',
                          style: TextStyle(
                            color: Colors.white38,
                          ),
                        ),
                      ),
                      hintText: widget.characterContacts.company.name,
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  child: TextField(
                    obscureText: true,
                    autofocus: false,
                    readOnly: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white38,
                            width: 0.5),
                      ),
                      border: OutlineInputBorder(),
                      label: Container(
                        child: Text(
                          'Address',
                          style: TextStyle(
                            color: Colors.white38,
                          ),
                        ),
                      ),
                      hintText: widget.characterContacts.address.street,
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Image(image: AssetImage('icons/image_map.png',),),
                // Expanded(
                //     child: Container(
                //         padding: const EdgeInsets.all(8),
                //         child: const YandexMap(
                //         )
                //     )
                // ),
              ],
            );
          }
        ),
      ),
    );
  }
}

