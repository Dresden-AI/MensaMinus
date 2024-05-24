import 'package:flutter/material.dart';
import 'package:mensa_minus/screens/widgets/meal_tile.dart';

import '../../model/canteen.dart';

class CanteenMeal extends StatelessWidget {
  final Canteen canteen;

  const CanteenMeal({super.key, required this.canteen});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      expandedAlignment: Alignment.centerLeft,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      initiallyExpanded: true,
      title: Text(
        canteen.name,
        style: const TextStyle(
          fontSize: 30,
        ),
      ),
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 5),
          title: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),

            itemCount: canteen.meals.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: MealTile(
                  meal: canteen.meals[index],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
