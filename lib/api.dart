import 'dart:convert';

import 'model/canteen.dart';
import 'model/meal.dart';
import 'utils/date_formatter.dart';
import 'utils/http_utils.dart';

class Api {
  /// Retrieves all configured canteens
  Future<List<Canteen>> getCanteens() async {
    var uri = Uri.https("api.studentenwerk-dresden.de", "openmensa/v2/canteens");
    var response = HttpUtils.getResponse(uri);

    return response.then((value) {
      var canteenData = jsonDecode(value) as List<dynamic>;
      return canteenData
          .map((canteen) => Canteen(canteen["id"], canteen["name"]))
          .toList();
    });
  }

  /// Retrieves all meals for the provided canteen on a specific day
  Future<List<Meal>> getMeals(Canteen canteen, DateTime date) async {
    var formattedDate = DateFormatter.formatDate(date);
    var uri = Uri.https("api.studentenwerk-dresden.de", "openmensa/v2/canteens/${canteen.id}/days/$formattedDate/meals");
    var response = HttpUtils.getResponse(uri);

    return response.then((value) {
      var mealData = jsonDecode(value) as List<dynamic>;
      List<Meal> meals = [];

      for (var meal in mealData) {
        var notes = (meal["notes"] as List)
            .map((e) => e as String)
            .toList(growable: false);

        var prices = (meal["prices"] as Map)
            .map((key, value) => MapEntry(key as String, value.toDouble() as double));

        meals.add(Meal(meal["id"], meal["name"], meal["category"], meal["image"], notes, prices));
      }

      return meals;
    });
  }
}
