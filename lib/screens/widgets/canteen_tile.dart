import 'package:flutter/material.dart';
import 'package:mensa_minus/screens/widgets/meal_tile.dart';

import '../../model/canteen.dart';

class CanteenMeal extends StatelessWidget {
  final Canteen canteen;

  const CanteenMeal({super.key, required this.canteen});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      childrenPadding: const EdgeInsets.only(
        top: 15,
        bottom: 15,
      ),
      title: Text(
        canteen.name,
        style: const TextStyle(
          fontSize: 30,
        ),
      ),
      children: canteen.meals
          .map((meal) => MealTile(meal: meal))
          .toList(),
    );
  }
}
