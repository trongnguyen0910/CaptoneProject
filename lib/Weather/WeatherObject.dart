import 'package:flutter/material.dart';

import '../Controller/WeatherController.dart';



class WeatherObject extends StatefulWidget {
  const WeatherObject({super.key, required this.weather});
  final Data weather;

  @override
  State<WeatherObject> createState() => _WeatherObjectState();
}

class _WeatherObjectState extends State<WeatherObject> {
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
                            child: Text(
                              widget.weather.description!.substring(8),
                              style: TextStyle(
                                  color: Colors.blue.shade900, fontSize: 14.0),
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
