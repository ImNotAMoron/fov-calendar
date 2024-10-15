DateTime findMonday (DateTime currentDate) {
  // Calculate the difference in days from Monday (Monday is considered as 1)
  int daysToSubtract = currentDate.weekday - DateTime.monday;

  // Subtract the days to get the Monday of the current week
  return currentDate.subtract(Duration(days: daysToSubtract));
}

bool isSameDate(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month
      && a.day == b.day;
}

String generateBreakText(int minutes) {
  int hours = (minutes / 60).floor();
  int realMinutes = (minutes % 60);
  String hoursText = hours >= 1 ? "${hours} hour${hours % 10 > 1 ? "s" : ""}" : "";
  String minutesText = realMinutes >= 1 ? "${hours > 0 ? " and" : ""} $realMinutes minute${minutes % 10 > 1 ? "s" : ""}" : "";
  String result = "$hoursText$minutesText break";
  return result;
}
