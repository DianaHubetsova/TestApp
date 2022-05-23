import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/character_bloc.dart';
import '../models/character_model.dart';
import '../repository/character_repository.dart';

import 'authorization_page.dart';
import 'character_info.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({Key? key}) : super(key: key);

  @override
  State<CharacterListPage> createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  final List<CharacterModel> _character = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CharacterBloc(dataRepository: CharacterServiceImplementation())
            ..add(const CharacterFetchEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 23, right: 24, bottom: 31),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AuthorizationPage()),
                          (Route<dynamic> route) => false);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'Выйти',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 24, left: 12),
                          child: Icon(
                            Icons.logout,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BlocBuilder<CharacterBloc, CharacterState>(
                    builder: (context, characterState) {
                      if (characterState is CharacterSuccessState) {
                        _character.addAll(characterState.character);
                      }
                      return Padding(
                        padding: const EdgeInsets.only(left: 13, right: 9),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                controller: _scrollController
                                  ..addListener(
                                    () {
                                      if (_scrollController.offset ==
                                              _scrollController
                                                  .position.maxScrollExtent &&
                                          !BlocProvider.of<CharacterBloc>(
                                                  context)
                                              .isFetching) {
                                        BlocProvider.of<CharacterBloc>(context)
                                            .fetch();
                                      }
                                    },
                                  ),
                                itemCount: _character.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () async {
                                      await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CharacterInfoPage(
                                                    character:
                                                        _character[index],
                                                  )));
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: const EdgeInsets.only(bottom: 16),
                                      child: Container(
                                        height: 131,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: const Color(0xFF6657A1)),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 21, right: 15),
                                              child: Text(
                                                '#${index + 1}',
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            const VerticalDivider(
                                                color: Colors.white,
                                                indent: 25,
                                                endIndent: 18,
                                                width: 1),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 14,
                                                    left: 16,
                                                    right: 24,
                                                    bottom: 28),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      _character[index]
                                                          .name
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white),
                                                    ),
                                                    const SizedBox(height: 12),
                                                    const SizedBox(
                                                      height: 54,
                                                      child: Text(
                                                          'Значимость этих проблем настолько очевидна, что начало повседневной работы по формированию позиции . . . ',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.white,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
