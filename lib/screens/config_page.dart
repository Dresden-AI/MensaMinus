import 'package:flutter/material.dart';
import 'package:mensa_minus/api.dart';
import 'package:mensa_minus/screens/widgets/canteen_toggle.dart';

import '../model/canteen.dart';

class ConfigPage extends StatefulWidget {
  final List<Canteen> canteens;

  final List<Canteen> selectedCanteens;
  const ConfigPage({super.key, required this.canteens, required this.selectedCanteens});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.refresh_sharp)),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.canteens.length,
              itemBuilder: (BuildContext context, int index) {
                return CanteenToggle(canteen: widget.canteens[index], widget.selectedCanteens);
              },

            )
          ],
        ),
      )
    );
  }
}
