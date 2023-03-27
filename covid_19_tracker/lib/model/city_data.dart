class CityData {
  String name;
  String? notes;
  int active;
  int confirmed;
  int deceased;
  int recovered;

  CityData(
      {required this.active,
      required this.confirmed,
      required this.deceased,
      this.notes,
      required this.name,
      required this.recovered});

  static CityData fromJSON(var data, String cityName) {
    String notes = data["notes"];
    int active = data["active"];
    int confirmed = data["confirmed"];
    int deceased = data["deceased"];
    int recovered = data["recovered"];
    return CityData(
      active: active,
      confirmed: confirmed,
      deceased: deceased,
      recovered: recovered,
      notes: notes,
      name: cityName,
    );
  }
}
