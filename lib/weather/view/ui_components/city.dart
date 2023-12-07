class City {
  const City({
    required this.name,
    required this.latitude,
    required this.longitude,
  });
  final String name;
  final double latitude;
  final double longitude;

  static const tokyo = City(name: '東京', latitude: 35.6895, longitude: 139.6917);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is City && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
