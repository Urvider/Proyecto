import 'dart:convert';

class Food {
  String id;
  String title;
  String difficulty;
  String portion;
  String time;
  String description;
  List<String> ingredients;
  List<Method> method;
  String image;

  Food({
    required this.id,
    required this.title,
    required this.difficulty,
    required this.portion,
    required this.time,
    required this.description,
    required this.ingredients,
    required this.method,
    required this.image,
  });

  factory Food.fromRawJson(String str) => Food.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson());

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"],
        title: json["title"],
        difficulty: json["difficulty"],
        portion: json["portion"],
        time: json["time"],
        description: json["description"],
        ingredients: List<String>.from(json["ingredients"].map((x) => x)),
        method:
            List<Method>.from(json["method"].map((x) => Method.fromJson(x))),
        image: json["image"],
      );
/*
    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "difficulty": difficulty,
        "portion": portion,
        "time": time,
        "description": description,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
        "method": List<dynamic>.from(method.map((x) => x.toJson())),
        "image": image,
    }; */
}

class Method {
  String? step1;
  String? step2;
  String? step3;

  Method({
    this.step1,
    this.step2,
    this.step3,
  });

  factory Method.fromRawJson(String str) => Method.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson());

  factory Method.fromJson(Map<String, dynamic> json) => Method(
        step1: json["Step 1"],
        step2: json["Step 2"],
        step3: json["Step 3"],
      );
/*
    Map<String, dynamic> toJson() => {
        "Step 1": step1,
        "Step 2": step2,
        "Step 3": step3,
    }; */
}
