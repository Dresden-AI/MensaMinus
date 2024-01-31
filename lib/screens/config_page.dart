import 'package:flutter/material.dart';
import 'package:mensa_minus/screens/widgets/canteen_toggle.dart';
import 'package:mensa_minus/utils/datatypes.dart';

import '../model/canteen.dart';

class ConfigPage extends StatelessWidget {
  final List<Canteen> canteens;
  final SelectedCanteens selectedCanteens;
  const ConfigPage({super.key, required this.canteens, required this.selectedCanteens});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              // TODO: Why refresh?
              icon: const Icon(Icons.refresh_sharp)),
            ListView.builder(
              shrinkWrap: true,
              itemCount: canteens.length,
              itemBuilder: (BuildContext context, int index) {
                return CanteenToggle(canteen: canteens[index], selectedCanteens: selectedCanteens);
              },
            )
          ],
        ),
      )
    );
  }
}
