import 'package:flutter/material.dart';
import 'package:mensa_minus/model/meal.dart';

class MealTile extends StatelessWidget {
  final Meal meal;

  const MealTile({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Text(meal.name);
  }
}
