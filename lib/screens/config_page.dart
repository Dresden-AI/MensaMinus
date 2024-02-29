import 'package:flutter/material.dart';
import 'package:mensa_minus/screens/widgets/canteen_toggle.dart';

import '../model/canteen.dart';

class ConfigPage extends StatelessWidget {
  final List<Canteen> canteens;
  final List<Canteen> selectedCanteens;

  const ConfigPage({super.key, required this.canteens, required this.selectedCanteens});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Konfiguration"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: canteens.length,
          itemBuilder: (BuildContext context, int index) {
            return CanteenToggle(canteen: canteens[index], selectedCanteens: selectedCanteens);
          },
        ),
      )
    );
  }
}
