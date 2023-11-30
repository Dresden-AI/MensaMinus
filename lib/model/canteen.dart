/// Represents a canteen on the campus
class Canteen {
  final int id;
  final String name;

  Canteen(this.id, this.name);

  @override
  String toString() {
    return 'Canteen{id: $id, name: $name}';
  }
}
