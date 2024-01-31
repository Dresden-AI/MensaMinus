import 'package:flutter/material.dart';
import 'package:mensa_minus/screens/home_page.dart';
import 'package:mensa_minus/utils/datatypes.dart';
import 'package:mensa_minus/utils/shared_prefs.dart';

import 'api.dart';
import 'model/canteen.dart';

Future<void> main() async {
  Api api = Api();
  List<Canteen> canteens = await api.getCanteens();
  SelectedCanteens selectedCanteens = await getSelectedCanteens(canteens);
  runApp(MensaMinusApp(canteens: canteens, selectedCanteens: selectedCanteens));
}

class MensaMinusApp extends StatelessWidget {
  final List<Canteen> canteens;
  final SelectedCanteens selectedCanteens;
  const MensaMinusApp({super.key, required this.canteens, required this.selectedCanteens, });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mensa Minus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(canteens: canteens, selectedCanteens: selectedCanteens)
    );
  }
}


