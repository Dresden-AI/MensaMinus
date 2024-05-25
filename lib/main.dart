import 'package:flutter/material.dart';
import 'package:mensa_minus/model/canteen_list.dart';
import 'package:mensa_minus/screens/home_page.dart';
import 'package:mensa_minus/utils/shared_prefs.dart';
import 'package:provider/provider.dart';

import 'api.dart';
import 'model/canteen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Api api = Api();
  List<Canteen> canteens = await api.getCanteens();
  List<Canteen> selectedCanteens = await getSelectedCanteens(canteens);

  runApp(MensaMinusApp(canteens: canteens, selectedCanteens: selectedCanteens));
}

class MensaMinusApp extends StatelessWidget {
  final List<Canteen> canteens;
  final List<Canteen> selectedCanteens;
  const MensaMinusApp({super.key, required this.canteens, required this.selectedCanteens});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mensa Minus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (context) => CanteenList(canteens: canteens, selectedCanteens: selectedCanteens),
        child: const HomePage(),
      ),
    );
  }
}
