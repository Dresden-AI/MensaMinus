import 'package:flutter/material.dart';

import '../model/canteen.dart';

class CanteenPage extends StatelessWidget {
  final List<Canteen> canteens;
  final List<Canteen> selectedCanteens;

  const CanteenPage({super.key, required this.canteens, required this.selectedCanteens});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Lieber mensen gehen!",
      ),
    );
  }
}
