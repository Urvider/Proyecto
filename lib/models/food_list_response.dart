import 'dart:convert';

class FoodListResponse {
  String id;
  String title;
  Difficulty difficulty;
  String image;

  FoodListResponse({
    required this.id,
    required this.title,
    required this.difficulty,
    required this.image,
  });

  factory FoodListResponse.fromRawJson(String str) =>
      FoodListResponse.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson());

  factory FoodListResponse.fromJson(Map<String, dynamic> json) =>
      FoodListResponse(
        id: json["id"],
        title: json["title"],
        difficulty: difficultyValues.map[json["difficulty"]]!,
        image: json["image"],
      );
/*
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "difficulty": difficultyValues.reverse[difficulty],
        "image": image,
      };
      */
}

enum Difficulty { EASY, MEDIUM }

final difficultyValues =
    EnumValues({"Easy": Difficulty.EASY, "Medium": Difficulty.MEDIUM});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
