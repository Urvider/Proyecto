import 'package:flutter/material.dart';
import 'package:my_app/screens/screens.dart';
import 'package:provider/provider.dart';
import 'providers/food_list_provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FoodProvider(),
          lazy: false,
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Comida Mexicana',
      initialRoute: 'home',
      onGenerateRoute: (settings) {
        if (settings.name == 'details') {
          final String foodId = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => DetailsScreen(foodId: foodId),
          );
        }
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      },
    );
  }
}
