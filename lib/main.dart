import 'package:flutter/material.dart';
import 'package:mensa_minus/screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';
import 'model/canteen.dart';

Future<void> main() async {
  var api = Api();
  var canteens = await api.getCanteens();
  var sharedPreferences = await SharedPreferences.getInstance();
  if(!sharedPreferences.containsKey('selectedCanteens')){
    sharedPreferences.setStringList('selectedCanteens', []);
  }
  var selectedCanteens = canteens.where((canteen) => sharedPreferences.getStringList('selectedCanteens')!.contains(canteen.name)).toList();
  runApp(MensaMinusApp(canteens: canteens, selectedCanteens: selectedCanteens));
}

class MensaMinusApp extends StatelessWidget {
  final List<Canteen> canteens;
  final List<Canteen> selectedCanteens;
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
      home: HomePage(canteens: canteens, selectedCanteens: selectedCanteens),
    );
  }
}


