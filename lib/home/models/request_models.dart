class RequestIncrease {
  String id;
  String name;
  String status;
  String companyName;
  String companyLogo;
  DateTime dataTime;
  double longitude;
  double latitude;
  int zip;
  String address;

  RequestIncrease.fromJson(Map<String, dynamic> map) {
    if (map == null) {
      return;
    }
    id = map['id'];
    name = map['name'];
    status = map['status'];
    companyName = map['companyName'];
    companyLogo = map['companyLogo'];
    dataTime = map['dateTime'];
    longitude = map['longitude'];
    latitude = map['latitude'];
    zip = map['zip'];
    address = map['address'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'companyName': companyName,
      'companyLogo': companyLogo,
      'dataTime': dataTime,
      'longitude': longitude,
      'latitude': latitude,
      'zip': zip,
      'address': address,
    };
  }
}
