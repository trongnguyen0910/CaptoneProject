import 'package:flutter/material.dart';

import '../Controller/WeatherController.dart';

class WeatherObject extends StatefulWidget {
  const WeatherObject({super.key, required this.weather});
  final Data weather;

  @override
  State<WeatherObject> createState() => _WeatherObjectState();
}

class _WeatherObjectState extends State<WeatherObject> {
  Widget _buildWeatherInfo(String title, String value) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.blue.shade900,
          fontSize: 14.0,
        ),
        children: [
          TextSpan(
            text: '$title: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: '$value\n',
          ),
        ],
      ),
    );
  }

  String _getTemperature(String description) {

    final RegExp regex = RegExp(r'(\d+° / \d+°)');
    final Match? match = regex.firstMatch(description);

    return match != null ? match.group(0)! : 'N/A';
  }


  String _getRain(String description) {
    final RegExp regex = RegExp(r'Mưa (\d+\.\d+) mm');
    final Match? match = regex.firstMatch(description);

    return match != null ? '${match.group(1)} mm' : 'N/A';
  }


  String _getWind(String description) {
    final RegExp regex = RegExp(r'Wind (\d+\.\d+) km/h');
    final Match? match = regex.firstMatch(description);

    return match != null ? '${match.group(1)} km/h' : 'N/A';
  }


  String _getPressure(String description) {
    final RegExp regex = RegExp(r'Áp suất (\d+\.\d+) mmhg');
    final Match? match = regex.firstMatch(description);

    return match != null ? '${match.group(1)} mmHg' : 'N/A';
  }

  String _getHumidity(String description) {
    final RegExp regex = RegExp(r'Độ ẩm (\d+) %');
    final Match? match = regex.firstMatch(description);

    return match != null ? '${match.group(1)}%' : 'N/A';
  }


  String _getSunriseSunset(String description) {
    final RegExp regex = RegExp(r'Mặt trời mọc/lặn (\d{2}:\d{2} \d{2}:\d{2})');
    final Match? match = regex.firstMatch(description);

    return match != null ? match.group(1)! : 'N/A';
  }

  @override
  Widget build(BuildContext context) {
    String picture = widget.weather.image ?? '';
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 65,
                    height: 65,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      // You can use like this way or like the below line
                      //borderRadius: new BorderRadius.circular(30.0),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: FadeInImage(
                        image: NetworkImage(picture),
                        fit: BoxFit.cover,
                        placeholder: NetworkImage(widget.weather.image!),
                      ),
                    )),
                const SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_city,
                                  size: 20.0,
                                  color: Colors.amberAccent,
                                ),
                                const SizedBox(
                                  width: 4.0,
                                ),
                                Expanded(
                                  child: Text(
                                    widget.weather.location ?? '',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Icon(
                                  Icons.date_range,
                                  size: 20.0,
                                  color: Colors.red,
                                ),
                                const SizedBox(
                                  width: 4.0,
                                ),
                                Expanded(
                                  child: Text(
                                    widget.weather.description!.substring(0, 8),
                                    style: TextStyle(
                                        color: Colors.red.shade900,
                                        fontSize: 14.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.description,
                            size: 20.0,
                            color: Colors.cyan,
                          ),
                          const SizedBox(
                            width: 4.0,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildWeatherInfo(
                                    'Nhiệt độ',
                                    _getTemperature(
                                        widget.weather.description!)),
                                _buildWeatherInfo('Lượng mưa',
                                    _getRain(widget.weather.description!)),
                                _buildWeatherInfo('Gió',
                                    _getWind(widget.weather.description!)),
                                _buildWeatherInfo('Áp suất',
                                    _getPressure(widget.weather.description!)),
                                _buildWeatherInfo('Độ ẩm',
                                    _getHumidity(widget.weather.description!)),
                                _buildWeatherInfo(
                                    'Mặt trời mọc/Mặt trời lặn',
                                    _getSunriseSunset(
                                        widget.weather.description!)),
                                // Add more information as needed...
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 4.0,
            color: Colors.grey.shade100,
          )
        ],
      ),
    );
  }
}
