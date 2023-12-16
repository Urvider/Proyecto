import 'package:flutter/material.dart';
import 'package:my_app/models/food.dart';
import 'package:my_app/providers/food_list_provider.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.foodId}) : super(key: key);

  final String foodId;

  @override
  Widget build(BuildContext context) {
    final foodProvider = Provider.of<FoodProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Alimento'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<Food>(
        future: foodProvider.getFoodDetails(foodId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error al cargar los detalles del alimento'));
          } else if (!snapshot.hasData) {
            return Center(
                child: Text('No se encontraron detalles para este alimento'));
          } else {
            Food food = snapshot.data!;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(food.image),
                  Text(
                    food.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(food.description),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
