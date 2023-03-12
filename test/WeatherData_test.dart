import 'package:flutter_test/flutter_test.dart';
import 'package:a_nice_weather_app/utils/weatherData.dart';

void main() {
  test("Nice degrees", () {
    double degree = 20.55;
    int checkDegree = celsiusToFahreneit(degree);
    expect(checkDegree, 69);
  });
  test("38 degrees test", () {
    double degree = 3.4;
    int checkDegree = celsiusToFahreneit(degree);
    expect(checkDegree, 38);
  });

  test("-5 test", () {
    double degree = -5;
    int checkDegree = celsiusToFahreneit(degree);
    expect(checkDegree, 23);
  });
  test("5 test", () {
    double degree = 5;
    int checkDegree = celsiusToFahreneit(degree);
    expect(checkDegree, 41 );

  });
}
