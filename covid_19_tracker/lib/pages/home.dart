import 'dart:convert';

import 'package:covid_19_tracker/model/state_data.dart';
import 'package:covid_19_tracker/pages/general_screen.dart';
import 'package:covid_19_tracker/pages/home_content.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:progress_indicators/progress_indicators.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final apiUrl =
      Uri.parse('https://api.covid19india.org/state_district_wise.json');
  List<StateData> statesData = [];

  @override
  void initState() {
    super.initState();
    fetchStatesData();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScreen(
      content: statesData.isEmpty
          ? Center(
              child: GlowingProgressIndicator(
                child: JumpingDotsProgressIndicator(
                  fontSize: 100.0,
                  color: Colors.lightGreen,
                  milliseconds: 200,
                ),
              ),
            )
          : HomeContent(statesData: statesData),
    );
  }

  fetchStatesData() async {
    final resp = await http.get(apiUrl);
    final Map data = json.decode(resp.body);
    List statesNames = data.keys.toList();
    statesNames.removeAt(0);

    for (int i = 0; i < statesNames.length; i++) {
      final stateData =
          StateData.fromJson(data[statesNames[i]], statesNames[i]);
      statesData.add(stateData);
    }
    setState(() {});
  }
}
