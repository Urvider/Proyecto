import 'package:flutter/material.dart';
import 'package:my_app/providers/food_list_provider.dart';
import 'package:my_app/widgets/card_swiper.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final foodProvider = Provider.of<FoodProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: Text('Lista de Comida Mexicana'),
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            child: CardSwiper(foods: foodProvider.mapOfMaps),
          ),
        ],
      ),
    );
  }
}
