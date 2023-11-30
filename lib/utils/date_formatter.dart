class DateFormatter {
  static String formatDate(DateTime date) {
    var year = "${date.year}".padLeft(4, "0");
    var month = "${date.month}".padLeft(2, "0");
    var day = "${date.day}".padLeft(2, "0");
    return "$year-$month-$day";
  }
}
