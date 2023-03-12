import 'package:a_nice_weather_app/utils/fetchJson.dart';
import 'package:flutter/cupertino.dart';

Future fetchWeatherData() async {
  const String weatherStation =
      "https://api.weather.gov/stations/KLNS/observations/latest";
  final currentWeatherData = await fetchJson(weatherStation);
  num? celsius = currentWeatherData['properties']['temperature']
      ['value']; // replace with your Celsius value
  if (celsius != null ) {
    var fahrenheit = celsiusToFahreneit(celsius);
    //return 69;
    return fahrenheit;
  } else {
    // no data
    return 255;
  }
}

int celsiusToFahreneit(num celsius) {
    double fahrenheit = (celsius * 9 / 5) + 32;
    return fahrenheit.round();
}
