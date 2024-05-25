import 'meal.dart';

/// Represents a canteen on the campus
class Canteen {
  final int id;
  final String name;
  List<Meal>? _meals = [];

  Canteen(this.id, this.name);

  set meals(List<Meal> meals) => _meals = meals;
  List<Meal> get meals => List<Meal>.from(_meals ?? []);

  @override
  String toString() {
    return 'Canteen{id: $id, name: $name}';
  }
}
