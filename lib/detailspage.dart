import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_v2/controllers/weather_controller.dart';
import 'package:weather_app_v2/model/weather_response.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);  

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final WeatherControllerImpl weatherControllerImpl = WeatherControllerImpl();

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async{
    WeatherApiResponse? weatherApiResponse = await weatherControllerImpl.getWeather();
    print(weatherApiResponse!.timezone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F5F7),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xffF3F5F7),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Accra, ',
              style: TextStyle(
                  color: Color(0xFF51586F), fontWeight: FontWeight.bold),
            ),
            Text(
              'Ghana',
              style: TextStyle(
                  color: Color(0xFF51586F), fontWeight: FontWeight.w400),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.black,
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FeatherIcons.alignRight,
                color: Colors.black,
              ))
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                const Text('Next 7 days',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff51586F),
                        fontSize: 20)),
                const SizedBox(height: 25),
                WeatherDetail(),
                const SizedBox(height: 15),
                const Divider(color: Colors.grey),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Precipitation',
                            style: TextStyle(
                                color: Color(0xFF51586F),
                                fontWeight: FontWeight.bold),
                          ),
                          Text('70%')
                        ],
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Wind',
                              style: TextStyle(
                                  color: Color(0xFF51586F),
                                  fontWeight: FontWeight.bold)),
                          Text('8 km/h')
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Humidity',
                              style: TextStyle(
                                  color: Color(0xFF51586F),
                                  fontWeight: FontWeight.bold)),
                          Text('65%')
                        ],
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Pressure',
                              style: TextStyle(
                                  color: Color(0xFF51586F),
                                  fontWeight: FontWeight.bold)),
                          Text('940 hPa')
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(height: 15),
                  WeatherDetail(),
                  SizedBox(height: 10),
                  Divider(color: Colors.grey),
                  SizedBox(height: 15),
                  WeatherDetail(),
                  SizedBox(height: 10),
                  Divider(color: Colors.grey),
                  SizedBox(height: 15),
                  WeatherDetail(),
                  SizedBox(height: 10),
                  Divider(color: Colors.grey),
                  SizedBox(height: 15),
                  WeatherDetail(),
                  SizedBox(height: 10),
                  Divider(color: Colors.grey),
                  SizedBox(height: 15),
                  WeatherDetail(),
                  SizedBox(height: 10),
                  Divider(color: Colors.grey),
                  SizedBox(height: 15),
                  WeatherDetail(),
                  SizedBox(height: 10),
                  Divider(color: Colors.grey),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class WeatherDetail extends StatelessWidget {
  WeatherDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children:  [
          const Icon(FeatherIcons.sun),
          const SizedBox(width: 15),
          Text(
            DateFormat('EEEE, d MMM').format(DateTime(1646326800)),
            style: const TextStyle(
                fontSize: 18,
                color: Color(0xff51586F),
                fontWeight: FontWeight.w600),
          )
        ]),
        Wrap(
          spacing: 15,
          children: const [
            Text(
              '-1',
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.w600),
            ),
            Text(
              '-5',
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.w600),
            )
          ],
        )
      ],
    );
  }
}
