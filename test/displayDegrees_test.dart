
import 'package:a_nice_weather_app/utils/display.dart';
import 'package:flutter_test/flutter_test.dart';

void main () {

  test("Nice test for degrees", () {
    var nice = 69;
    var displayNice = displayDegrees(nice);
    expect(displayNice, "Nice");
    // assert
  }
  );
 test('forthy test for degrees', () {
   var forthy = 44;
   var displayForthy = displayDegrees(forthy);
   expect(displayForthy, "44 \u2109");
 });

 test('bad data', ()  {
   var badData = "bad";

 } );

}