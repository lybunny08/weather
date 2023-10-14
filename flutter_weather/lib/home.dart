import 'package:flutter/material.dart';
import 'package:flutter_weather/getLocation.dart';
import 'Mediaquery.dart';
import 'package:flutter_weather/weatherModel.dart';
import 'package:flutter_weather/weatherData.dart';

class HomePage extends StatelessWidget {
  final CustomSize _size = CustomSize();
  final WeatherData client = WeatherData();
  var data;

  Future<void> info() async {
    var position = await GetPosition();
    data = await client.getData(position.latitude, position.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: info(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Container(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Container(
                      height: _size.height(context) * 0.75,
                      width: _size.width(context),
                      padding: EdgeInsets.only(top: 30),
                      margin: EdgeInsets.only(right: 10, left: 10),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(40),
                        gradient: LinearGradient(
                          colors: [Color(0xff955cd1), Color(0xff3fa2fa)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0.2, 0.85],
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 15),
                          Text(
                            'Madagascar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'date 24 Juin 2023',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 15,
                            ),
                          ),
                          Image.network(
                            'https:${data?.icon}',
                            width: _size.width(context) * 0.36,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(height: 10),
                          Text(
                            '${data?.condition}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '${data?.temp} °C',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 90),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/wind.png',
                                      width: _size.width(context) * 0.15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        '${data?.wind} km/h',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        'Wind',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.7),
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/humidity.png',
                                      width: _size.width(context) * 0.15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        '${data?.humidity}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        'Humidity',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.7),
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/windsock.png',
                                      width: _size.width(context) * 0.15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        '${data?.wind_dir}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        'Wind direction',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.7),
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Gust',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '${data?.gust} kp/h',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Pressure',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '${data?.pressure} hpa',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Uv',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '${data?.uv}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Precipitation',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '${data?.precipe}mm',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Wind',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '${data?.wind}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Last Updates',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '${data?.last_updated}',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 19,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }
}
