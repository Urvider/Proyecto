import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/models/food.dart';
//import 'package:provider/provider.dart';

class FoodProvider extends ChangeNotifier {
  String _baseUrl = 'the-mexican-food-db.p.rapidapi.com';
  String _apiKey = '6c04a7e51amsh4243a25989dde3bp16dc27jsn0fbe86be8e66';

  Map<String, dynamic> mapOfMaps = {};
  Map<String, dynamic> listfood = {};

  FoodProvider() {
    getOnDisplayFood();
  }

  getOnDisplayFood() async {
    final uri = Uri.https(_baseUrl, '/');
    final response = await http.get(
      uri,
      headers: {
        'x-rapidapi-host': _baseUrl,
        'x-rapidapi-key': _apiKey,
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> decodedData = json.decode(response.body);
      List<Map<String, dynamic>> listOfMaps =
          List<Map<String, dynamic>>.from(decodedData);

      mapOfMaps = {};

      //para madar a llamar el formato y ver que datos
      /*for (var map in listOfMaps) {
          print('Map:');
          print('ID: ${map['id']}');
          print('Title: ${map['title']}');
          print('Difficulty: ${map['difficulty']}');
          print('Image: ${map['image']}');
          print('------------------------');
        }*/

      listOfMaps.forEach((map) {
        final id = map['id'];
        mapOfMaps[id] = map;
      });

      //print(mapOfMaps);
    } else {
      print('Request failed with status: ${response.statusCode}');
    }

    notifyListeners();
  }

  Future<Food> getFoodDetails(String foodId) async {
    if (listfood.containsKey(foodId)) {
      return listfood[foodId]!;
    }

    final uri = Uri.https(_baseUrl, '/$foodId');
    final response = await http.get(
      uri,
      headers: {
        'x-rapidapi-host': _baseUrl,
        'x-rapidapi-key': _apiKey,
      },
    );

    if (response.statusCode == 200) {
      final foodDetails = Food.fromJson(jsonDecode(response.body));

      listfood[foodId] = foodDetails;

      return foodDetails;
    } else {
      throw Exception('Error al obtener detalles del alimento');
    }
  }
}
