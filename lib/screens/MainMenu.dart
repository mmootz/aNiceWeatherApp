import 'package:flutter/material.dart';
import 'package:a_nice_weather_app/utils/weatherData.dart';
import 'package:a_nice_weather_app/utils/display.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';
import '../utils/fetchJson.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key, required this.title});

  final String title;

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  var display = "";
  late ConfettiController confetti;

  @override
  void initState() {
    getWeather();
    super.initState();
    confetti = ConfettiController(duration: const Duration(seconds: 1));
  }
  void shootConfetti() {
    confetti.play();
  }

  Future<void> getWeather() async {
    final currentWeather = await fetchWeatherData();
    // if no data is found return "No Data"
    //var currentWeather = 69;
      if (currentWeather != null ) {
      if (currentWeather == 69  ) {
        shootConfetti();
      }
      setState(() {
        //is Nice
        display = displayDegrees(currentWeather);
      });
    } else {
        setState(() {
          display = "No Data!";
        });
      }

  }

  Future<void> _refreshData() async {
    // Add your code to refresh the data here
    // For example, you can call an API to get the latest data

    // Wait for some time to simulate a loading delay
    //await Future.delayed(Duration(seconds: 2));
    getWeather();
    debugPrint('refresh');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Refreshed'),
    ));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(widget.title),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: confetti,
                blastDirectionality: BlastDirectionality.explosive,
                blastDirection: pi / 2,
                maxBlastForce: 200,
                numberOfParticles: 42,
                shouldLoop: false,
                colors: const [
                  Colors.green,
                  Colors.blue,
                  Colors.red,
                  Colors.green,
                  Colors.yellow
                ],
              ),
            ),

            Center(
              child: RefreshIndicator(
                onRefresh: _refreshData,
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Center(
                      child: const Text(
                        'Intercourse, PA is:',
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                    Center(
                      child: Text(display,
                          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 72 )),
                    )
                  ],
                ),
              ),
            ),

            // isNice ? italic style / normal 55 f
            //ElevatedButton(onPressed: _incrementCounter, child: Text('Check'))
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
