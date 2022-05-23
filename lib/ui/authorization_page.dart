import 'package:flutter/material.dart';
import 'package:test_app/ui/character_list_page.dart';

class AuthorizationPage extends StatelessWidget {
  AuthorizationPage({Key? key}) : super(key: key);
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF6657A1),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            const Center(
              child: Text(
                'Авторизация',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                right: 29,
                left: 29,
              ),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      controller: _loginController,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        labelText: 'Логин',
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      //validator: (value) {},
                    ),
                    const SizedBox(height: 43),
                    TextFormField(
                      controller: _passwordController,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        labelText: 'Пароль',
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      //validator: (value) {},
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 39.00,
                ),
                child: GestureDetector(
                  onTap: () {
                    if (_loginController.text == 'login' &&
                        _passwordController.text == 'admin') {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CharacterListPage()),
                          (Route<dynamic> route) => false);
                    } else {
                      return;
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 262,
                    height: 65,
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Color(0xFF333333),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ], color: Color(0xFF333333)),
                    child: const Center(
                      child: Text(
                        'ВОЙТИ',
                        style: TextStyle(color: Colors.white, fontSize: 21),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
