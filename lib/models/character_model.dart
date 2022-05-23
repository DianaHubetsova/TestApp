import 'dart:convert';

CharacterModel weatherResponseFromJson(String str) =>
    CharacterModel.fromJson(json.decode(str));

String weatherResponseToJson(CharacterModel data) => json.encode(data.toJson());

class CharacterModel {
  CharacterModel({
    required this.id,
    required this.name,
    required this.image,
  });

  final int id;
  final String name;
  final String image;

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
