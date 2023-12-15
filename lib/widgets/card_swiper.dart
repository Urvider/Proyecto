import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  final Map<String, dynamic> foods;
  const CardSwiper({super.key, required this.foods});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.8,
      child: Swiper(
        itemCount: foods.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.8,
        itemHeight: size.height * 0.5,
        itemBuilder: (_, int index) {
          var food = foods.values.toList()[index];

          var id = food['id'] ?? 'Unknown';
          //var title = food['title'] ?? 'Unknown';
          //var difficulty = food['difficulty'];
          var image = food['image'] ?? 'assets/no-image.jpg';

          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'details', arguments: id);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(image),
              ),
            ),
          );
        },
      ),
    );
  }
}
