import 'package:actual_flutter/restaurant/component/restaurant_card.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: RestaurantCard(
            image: Image.asset('asset/img/food/ddeok_bok_gi.jpg'),
            name: '불타는 떡볶이',
            tags: ['떡볶이', '치즈', '매운맛'],
            ratingCount: 100,
            rating: 4.52,
            deliveryTime: 15,
            deliveryFee: 2000,
          ),
        ),
      ),
    );
  }
}
