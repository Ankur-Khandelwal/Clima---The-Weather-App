class DayorNight {
  var time = new DateTime.now();

  bool daytime() {
    if (time.hour <= 18 && time.hour >= 5) {
      return true;
    } else {
      return false;
    }
  }
}
