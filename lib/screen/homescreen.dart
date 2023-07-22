// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_scnd/controller/getlocation.dart';
import 'package:weather_scnd/model/model.dart';
import 'package:weather_scnd/services/weather.dart';
import 'package:weather_scnd/utils/widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  Weather? data;
  @override
  Widget build(BuildContext context) {
    info();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      decoration:const BoxDecoration(
          gradient:  LinearGradient(
              colors: [
                Color.fromARGB(255, 199, 177, 101),
                Color.fromARGB(255, 86, 144, 250),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.2, 0.85])),
      child: FutureBuilder(
        future: info(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 55),
                  height: size.height * 0.7,
                  width: size.width,
                  child: Column(
                    children: [
                      Text(
                        '${data?.cityName}',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.9), fontSize: 40),
                      ),
                      box(10),
                      Text(
                        dateFormat,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.9), fontSize: 15),
                      ),
                      Image.network(
                        'http:${data?.icon}',
                        width: size.width * 0.4,
                        height: size.height * 0.2,
                        fit: BoxFit.contain,
                      ),
                      box(5),
                      Text(
                        '${data?.condition}',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.9), fontSize: 20),
                      ),
                      box(10),
                      Text(
                        '${data?.temp}°',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                      box(30),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/icons/windspeed.png',
                                  width: size.width * 0.15,
                                ),
                                box(10),
                                Text(
                                  '${data?.wind}km/h',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                box(10),
                                const Text(
                                  'Wind',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/icons/humidity.png',
                                  width: size.width * 0.15,
                                ),
                                box(10),
                                Text(
                                  '${data?.humidity}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                box(10),
                                const Text(
                                  'Humidity',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/icons/clouds.png',
                                  width: size.width * 0.15,
                                ),
                                box(10),
                                Text(
                                  '${data?.wind_direc}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                box(10),
                                const Text(
                                  'Wind Direction',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                // box(25),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        normalText('Gust'),
                        infoText('${data?.gust} kp/h'),
                        hBox,
                        normalText('Pressure'),
                        infoText('${data?.pressure} hpa')
                      ],
                    ),
                    Column(
                      children: [
                        normalText('UV'),
                        infoText('${data?.uv}'),
                        const SizedBox(height: 35),
                        normalText('Precipitation'),
                        infoText('${data?.precip} mm')
                      ],
                    ),
                    Column(
                      children: [
                        normalText('Wind'),
                        infoText('${data?.wind} km/h'),
                        hBox,
                        normalText('Last Update'),
                        Text(
                          '${data?.last_update}',
                          style: const TextStyle(
                              color: Colors.green, fontSize: 15),
                        )
                      ],
                    )
                  ],
                )
                  ],
                )
              ],
            );
          }
        },
      ),
    ));
  }

  Future info() async {
    final position = await getPosition();
    await WeatherServices().getData(position.latitude, position.longitude).then(
          (value) => {data = value},
        );
  }
}

var dayInfo = DateTime.now();
var timeFormat =
    DateFormat('h:mm a').format(dayInfo); // Formats the time using AM/PM format
var dateFormat = DateFormat('EEE, d MMM, yyyy').format(dayInfo);
