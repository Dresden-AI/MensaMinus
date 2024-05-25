String formatEuros(double euros) {
  var parts = "$euros".split(".");
  return "${parts[0]},${parts[1].padRight(2, "0")} €";
}