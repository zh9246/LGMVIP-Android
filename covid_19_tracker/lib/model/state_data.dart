import 'package:covid_19_tracker/model/city_data.dart';

class StateData {
  String? stateCode;
  String name;
  List<CityData> citiesData;
  int? noOfCities;
  int? totalCases;

  StateData(
      {this.stateCode,
      required this.citiesData,
      this.noOfCities,
      required this.name,
      this.totalCases});

  static StateData fromJson(final data, String name) {
    String stateCode = data['statecode'];
    Map districtData = data['districtData'];
    List citiesNames = districtData.keys.toList();
    int noOfCities = citiesNames.length;
    int totalCases = 0;
    List<CityData> citiesData = [];

    for (int i = 0; i < noOfCities; i++) {
      CityData cityData =
          CityData.fromJSON(districtData[citiesNames[i]], citiesNames[i]);
      totalCases += cityData.confirmed;
      citiesData.add(cityData);
    }
    return StateData(
      noOfCities: noOfCities,
      stateCode: stateCode,
      name: name,
      citiesData: citiesData,
      totalCases: totalCases,
    );
  }
}
