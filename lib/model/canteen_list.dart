import 'package:flutter/material.dart';
import 'package:mensa_minus/model/canteen.dart';

import '../api.dart';

class CanteenList extends ChangeNotifier {
  final api = Api();
  late final List<Canteen> _availableCanteens;
  late List<Canteen> _selectedCanteens;

  CanteenList({required canteens, required selectedCanteens}) {
    _availableCanteens = canteens;
    _selectedCanteens = selectedCanteens;

    refreshAllMeals();
  }

  List<Canteen> get availableCanteens => _availableCanteens;
  List<Canteen> get selectedCanteens => _selectedCanteens;

  Future<void> refreshAllMeals() async {
    for (var canteen in _selectedCanteens) {
      fetchMeals(canteen);
    }
  }

  Future<void> fetchMeals(Canteen canteen) async {
    // TODO: Check for the date of the cache
    if (canteen.meals.isNotEmpty) return;

    canteen.meals = await api.getMeals(canteen, DateTime.now());
    notifyListeners();
  }

  void select(Canteen canteen) {
    _selectedCanteens.add(canteen);
    fetchMeals(canteen);
    notifyListeners();
  }

  void unselect(Canteen canteen) {
    _selectedCanteens.remove(canteen);
    notifyListeners();
  }
}
