import 'package:covid_19_tracker/pages/info_screens/states_info_screen.dart';
import 'package:flutter/material.dart';

import '../model/state_data.dart';

class HomeContent extends StatelessWidget {
  final List<StateData> statesData;

  const HomeContent({super.key, required this.statesData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'States info.',
          style: TextStyle(
              fontSize: 18,
              color: Colors.lightGreen,
              fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: statesData.length,
            itemBuilder: (context, index) {
              final stateData = statesData[index];
              return StateInfoTile(stateData: stateData);
            },
          ),
        ),
      ],
    );
  }
}

class StateInfoTile extends StatelessWidget {
  const StateInfoTile({
    Key? key,
    required this.stateData,
  }) : super(key: key);

  final StateData stateData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.0),
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
              builder: (context) => StatesInfoScreen(stateData: stateData),
            ),
          );
        },
        title: Text(
          stateData.name,
          style: const TextStyle(
              fontSize: 20, fontFamily: 'DynaPuff', letterSpacing: 2.0),
        ),
        subtitle: Text(
            'Total Cities: ${stateData.noOfCities}\nTotal Cases: ${stateData.totalCases}'),
        contentPadding: const EdgeInsets.all(12),
        textColor: Colors.white,
        trailing: const Icon(Icons.arrow_forward, color: Colors.white),
      ),
    );
  }
}
