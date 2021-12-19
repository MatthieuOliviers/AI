class DrugsList {
  String drug; // country of the service
  String package; // mandatory vaccine

  DrugsList({required this.drug, required this.package});
}

getMyPharmacyShoppingList() async {
//    String data = await rootBundle.loadString("lib/emergency_number_by_country.json");
//    final jsonResult = json.decode(data);
//    return response.jsonResult;

  List<DrugsList> data = [
    DrugsList(drug: 'Dafalgan', package: '500mg'),
    DrugsList(drug: 'Indutaro', package: '1g'),
  ];
  return data;
}
