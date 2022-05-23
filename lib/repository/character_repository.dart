import '../models/character_model.dart';
import 'package:dio/dio.dart';

abstract class CharacterService {
  Future<List<CharacterModel>> getAllCharacters(int page);
}

class CharacterServiceImplementation extends CharacterService {
  static final Dio _dio = Dio();

  @override
  Future<List<CharacterModel>> getAllCharacters(int page) async {
    try {
      List<Map<String, dynamic>> allEntities = [];

      var response = await _dio.get(
        'https://rickandmortyapi.com/api/character/?page=$page',
      );

      allEntities.addAll(
        List<Map<String, dynamic>>.from(response.data["results"]),
      );

      return List<CharacterModel>.from(
          allEntities.map((x) => CharacterModel.fromJson(x)));
    } on DioError catch (exc) {
      if (exc.response != null) {
        if (exc.response!.statusCode == 404) {
          throw Exception("You have reached the end of the character list.");
        } else {
          throw Exception(exc.response!.statusCode.toString() +
              ": " +
              exc.response!.statusMessage.toString());
        }
      } else {
        throw Exception("Couldn't fetch characters. Is the device online?");
      }
    }
  }
}
