class LocationData {
  final String name;
  final String url;

  LocationData(this.name, this.url);

  factory LocationData.fromJson(Map<String, dynamic> json) {
    return LocationData(json['name'] as String, json['url'] as String);
  }

}