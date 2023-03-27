import 'package:covid_19_tracker/model/city_data.dart';
import 'package:covid_19_tracker/pages/general_screen.dart';
import 'package:flutter/material.dart';

class CityInfoScreen extends StatelessWidget {
  final CityData cityData;

  CityInfoScreen({super.key, required this.cityData});
  @override
  Widget build(BuildContext context) {
    return GeneralScreen(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'City',
            style: _textStyle(fontSize: 15, color: Colors.lightGreen),
          ),
          Text(
            cityData.name,
            style: const TextStyle(
                fontSize: 50,
                color: Colors.lightGreen,
                fontFamily: 'DynaPuff',
                letterSpacing: 1.0),
          ),
          const SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildText("Active cases", cityData.active),
              buildText("Deceased", cityData.deceased),
              buildText("Recovered", cityData.recovered),
              buildText("Confirmed cases", cityData.confirmed),
              if (cityData.notes != '')
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Note: ${cityData.notes}",
                    style: _textStyle(
                        bold: true, fontSize: 18, color: Colors.blue),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  buildText(String title, dynamic value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.lightGreen,
            Colors.lightGreenAccent,
          ],
        ),
      ),
      child: ListTile(
        title: Text(
          title,
          style: _textStyle(),
          textAlign: TextAlign.start,
        ),
        trailing: Container(
          margin: const EdgeInsets.only(right: 20),
          child: Text(
            '$value',
            style: _textStyle(),
          ),
        ),
      ),
    );
  }

  _textStyle(
          {double fontSize = 20,
          bool bold = false,
          Color color = Colors.white}) =>
      TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: bold ? FontWeight.bold : null,
      );
}
