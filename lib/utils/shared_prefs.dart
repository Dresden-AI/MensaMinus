import 'package:mensa_minus/model/canteen.dart';
import 'package:mensa_minus/utils/datatypes.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SelectedCanteens> getSelectedCanteens(List<Canteen> canteens) async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  if(!sharedPreferences.containsKey('selectedCanteens')){
    sharedPreferences.setStringList('selectedCanteens', []);
    return SelectedCanteens([]);
  }
  return SelectedCanteens(canteens.where((canteen) => sharedPreferences.getStringList('selectedCanteens')!.contains(canteen.name)).toList());
}

void setSelectedCanteens(SelectedCanteens selectedCanteens) {
  SharedPreferences.getInstance().then(
    (SharedPreferences sharedPreferences) {
      List<String> selectedCanteensNames = selectedCanteens.list.map((canteen) => canteen.name).toList();
      sharedPreferences.setStringList('selectedCanteens', selectedCanteensNames);
    }
  );
}