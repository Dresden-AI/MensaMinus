import 'package:flutter/material.dart';
import 'package:mensa_minus/model/canteen_list.dart';
import 'package:mensa_minus/screens/widgets/canteen_toggle.dart';
import 'package:provider/provider.dart';


class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Consumer<CanteenList>(
          builder: (BuildContext context, CanteenList canteenList, Widget? child) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: canteenList.availableCanteens.length,
              itemBuilder: (BuildContext context, int index) {
                return CanteenToggle(
                  canteen: canteenList.availableCanteens[index],
                );
              },
            );
          },
        ),
      )
    );
  }
}
