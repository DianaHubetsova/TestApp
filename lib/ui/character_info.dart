import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/character_model.dart';
import 'authorization_page.dart';

class CharacterInfoPage extends StatelessWidget {
  final CharacterModel character;

  const CharacterInfoPage({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 23,right: 24,bottom: 57),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => AuthorizationPage()),
                              (Route<dynamic> route) => false);
                    },
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.end ,
                      children: const [
                        Text(
                          'Выйти',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        SizedBox(width: 12),
                        Icon(
                          Icons.logout,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 33.5,
                    right: 32.5,
                  ),
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset:
                          const Offset(0, 4), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Image.network(
                      character.image.toString(),
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                const SizedBox(height: 85),
                //const Spacer(),
                const Divider(
                  height: 1,
                  color: Color(0xFFe0e0e0),
                  indent: 27,
                  endIndent: 27,
                ),
                const SizedBox(height: 25),
                Container(
                  padding: const EdgeInsets.only(
                    left: 34.46,
                    right: 32.54,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 48,
                        child: Text(
                          character.name.toString(),
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 72,
                        child: Text(
                          'Значимость этих проблем настолько очевидна, что начало повседневной работы по формированию позиции . . . ',
                          style:
                          TextStyle(fontSize: 14, color: Color(0xFF3a3a3a)),
                        ),
                      ),
                      const SizedBox(
                        height: 48,
                        child: Text(
                          'Ссылка на тему',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF08299B),
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      const SizedBox(
                        height: 48,
                        child: Text(
                          'Ссылка на фото',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF08299B),
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 1,
                  color: Color(0xFFe0e0e0),
                  indent: 27,
                  endIndent: 27,
                ),
                const SizedBox(height: 84),
                //const Spacer(),
                Padding(
                  padding:
                  const EdgeInsets.only(bottom: 33, left: 83, right: 83),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      height: 42,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF000000).withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset:
                          const Offset(0, 4), // changes position of shadow
                        ),
                      ], color: const Color(0xFF333333)),
                      child: const Center(
                        child: Text(
                          'Назад',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
