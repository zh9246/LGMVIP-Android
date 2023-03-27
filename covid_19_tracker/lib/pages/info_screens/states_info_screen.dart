import 'package:covid_19_tracker/model/city_data.dart';
import 'package:covid_19_tracker/model/state_data.dart';
import 'package:covid_19_tracker/pages/general_screen.dart';
import 'package:flutter/material.dart';

import 'city_info_screen.dart';

class StatesInfoScreen extends StatelessWidget {
  final StateData stateData;

  const StatesInfoScreen({super.key, required this.stateData});

  @override
  Widget build(BuildContext context) {
    return GeneralScreen(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Cities info.',
            style: TextStyle(
                fontSize: 18,
                color: Colors.lightGreen,
                fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: stateData.citiesData.length,
              itemBuilder: (context, index) {
                final cityData = stateData.citiesData[index];
                return CityInfoTile(cityData: cityData);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CityInfoTile extends StatelessWidget {
  const CityInfoTile({
    Key? key,
    required this.cityData,
  }) : super(key: key);

  final CityData cityData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40.0),
          topLeft: Radius.circular(30.0),
          bottomLeft: Radius.circular(30.0),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.lightGreen,
            Colors.lightGreenAccent,
          ],
        ),
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CityInfoScreen(cityData: cityData)),
          );
        },
        title: Text(
          cityData.name,
          style: const TextStyle(
              fontSize: 20, fontFamily: 'DynaPuff', letterSpacing: 3.0),
        ),
        subtitle: Text(
            'Active Cases: ${cityData.active}\nCases confirmed: ${cityData.confirmed}'),
        contentPadding: const EdgeInsets.all(12),
        textColor: Colors.white,
        trailing: const Icon(Icons.arrow_forward, color: Colors.white),
      ),
    );
  }
}
