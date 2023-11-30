/// Represents a meal from a specific canteen
class Meal {
  final int id;
  final String name;
  final String category;
  final String image;
  final List<String> notes;
  final Map<String, double> prices;

  Meal(this.id, this.name, this.category, this.image, this.notes, this.prices);

  @override
  String toString() {
    return 'Meal{id: $id, name: $name, category: $category, image: $image, notes: $notes, prices: $prices}';
  }
}
