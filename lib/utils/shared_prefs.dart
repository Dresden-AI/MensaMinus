import 'package:mensa_minus/model/canteen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<Canteen>> getSelectedCanteens(List<Canteen> canteens) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  if (!sharedPreferences.containsKey('selectedCanteens')) {
    sharedPreferences.setStringList('selectedCanteens', []);
    return [];
  }

  return canteens.where((canteen) => sharedPreferences.getStringList('selectedCanteens')!.contains(canteen.name)).toList();
}

Future<void> setSelectedCanteens(List<Canteen> selectedCanteens) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  List<String> selectedCanteensNames = selectedCanteens.map((canteen) => canteen.name).toList();
  await sharedPreferences.setStringList('selectedCanteens', selectedCanteensNames);
}