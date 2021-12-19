class HealthRecord {
  String date; // date of the log
  String userID; // user of the log
  String weight; // weight data

  HealthRecord(
      {required this.date, required this.userID, required this.weight});
}

getHealthRecordPerDate() async {
//    String data = await rootBundle.loadString("lib/emergency_number_by_country.json");
//    final jsonResult = json.decode(data);
//    return response.jsonResult;

  List<HealthRecord> data = [
    HealthRecord(date: '21-dec-1969', userID: '1', weight: '5'),
    HealthRecord(date: '21-dec-1970', userID: '1', weight: '9'),
    HealthRecord(date: '21-dec-1971', userID: '1', weight: '13')
  ];
  return data;
}
