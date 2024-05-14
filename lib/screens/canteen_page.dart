import 'package:flutter/material.dart';
import 'package:mensa_minus/model/canteen_list.dart';
import 'package:mensa_minus/screens/widgets/canteen_tile.dart';
import 'package:provider/provider.dart';

class CanteenPage extends StatelessWidget {
  const CanteenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Consumer<CanteenList>(builder: (context, canteenList, child) {
          return RefreshIndicator(
            onRefresh: () async {
              return canteenList.refreshAllMeals();
            },
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: canteenList.selectedCanteens.length,
              itemBuilder: (BuildContext context, int index) {
                return CanteenMeal(canteen: canteenList.selectedCanteens[index]);
              },
            ),
          );
        }),
      ),
    );
  }
}
