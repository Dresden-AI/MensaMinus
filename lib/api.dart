import 'dart:convert';

import 'package:mensa_minus/utils/date_formatter.dart';
import 'package:mensa_minus/utils/http_utils.dart';

import 'model/canteen.dart';
import 'model/meal.dart';

class Api {
  Future<List<Canteen>> getCanteens() async {
    var uri =
        Uri.https("api.studentenwerk-dresden.de", "openmensa/v2/canteens");
    var response = HttpUtils.getResponse(uri);

    return response.then((value) {
      var canteenData = jsonDecode(value) as List<dynamic>;
      List<Canteen> canteens = [];

      for (var canteen in canteenData) {
        canteens.add(Canteen(canteen["id"], canteen["name"]));
      }

      return canteens;
    });
  }

  Future<List<Meal>> getMeals(Canteen canteen, DateTime date) async {
    var formattedDate = DateFormatter.formatDate(date);
    var uri = Uri.https("api.studentenwerk-dresden.de",
        "openmensa/v2/canteens/${canteen.id}/days/$formattedDate/meals");
    var response = HttpUtils.getResponse(uri);

    return response.then((value) {
      var mealData = jsonDecode(value) as List<dynamic>;
      List<Meal> meals = [];

      for (var meal in mealData) {
        var notes = (meal["notes"] as List)
            .map((e) => e as String)
            .toList(growable: false);
        var prices = (meal["prices"] as Map)
            .map((key, value) => MapEntry(key as String, value as double));

        meals.add(Meal(meal["id"], meal["name"], meal["category"],
            meal["image"], notes, prices));
      }

      return meals;
    });
  }
}
