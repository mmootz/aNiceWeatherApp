import 'package:flutter_test/flutter_test.dart';
import 'package:a_nice_weather_app/utils/fetchJson.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'fetch_json_test.mocks.dart';

class MockClient extends Mock implements http.Client {}

Future<void> main() async {
  test("Json fetch", () async {
    const jsonString = "http://test.com";
    const responseBody = '[{"test" : 20, "test2" : 23 }]';
    //"https://api.weather.gov/stations/KLNS/observations/latest";
    //final fetchedJson =  await fetchJson(jsonString);

    final mockClient = MockClient();
    when(mockClient.get(Uri.parse("http://test.com")))
        .thenAnswer((realInvocation) async => http.Response(responseBody, 200));
    
    final result = await fetchJson(jsonString);

    expect(await fetchJson("test"), '[{"temp" : "45"}]');
  });
}
