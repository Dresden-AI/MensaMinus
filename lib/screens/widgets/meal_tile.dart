import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:mensa_minus/model/meal.dart';
import 'package:mensa_minus/utils/currency_formatter.dart';

class MealTile extends StatelessWidget {
  final Meal meal;

  const MealTile({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(220, 220, 220, 1.0),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black54)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8, top: 4, left: 4),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              child: FullScreenWidget(
                disposeLevel: DisposeLevel.Low,
                child: Image.network(meal.image),
              ),
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(meal.name),
                Text(meal.prices.values.map((price) => formatEuros(price)).join(" / "))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
