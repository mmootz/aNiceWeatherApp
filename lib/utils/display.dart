String displayDegrees( int Degrees) {
  var displayText = "";

  if (Degrees == 69) {
    displayText = "Nice";
    // isNice = true
  } else {
    displayText = "$Degrees \u2109";
  }

  return displayText;

}