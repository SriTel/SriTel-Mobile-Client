
enum PackageType { data, voice, other}
enum RenewalType { daily, weekly, monthly, }

class Package{
  int id;
  String name;
  RenewalType renewal;
  PackageType type;
  String description;
  String image;
  double charge;
  double offPeekData;
  double peekData;
  double anytimeData;
  int s2SCallMins;
  int s2SSmsCount;
  int anyNetCallMins;
  int anyNetSmsCount;

  Package({
    required this.id,
    required this.name,
    required this.renewal,
    required this.type,
    required this.description,
    required this.image,
    required this.charge,
    this.offPeekData = 0,
    this.peekData = 0,
    this.anytimeData = 0,
    this.s2SCallMins = 0,
    this.s2SSmsCount = 0,
    this.anyNetCallMins = 0,
    this.anyNetSmsCount = 0,
  });

  // conversion methods
  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      id: json['id'],
      name: json['name'],
      renewal: _renewalTypeMapping[json['renewal']] ?? RenewalType.monthly,
      type: _packageTypeMapping[json['type']] ?? PackageType.data,
      description: json['description'],
      image: json['image'],
      charge: _jsonToDouble(json['charge']),
      offPeekData: _jsonToDouble(json['offPeekData']),
      peekData: _jsonToDouble(json['peekData']),
      anytimeData: _jsonToDouble(json['anytimeData']),
      s2SCallMins: json['s2SCallMins'],
      s2SSmsCount: json['s2SSmsCount'],
      anyNetCallMins: json['anyNetCallMins'],
      anyNetSmsCount: json['anyNetSmsCount'],
    );
  }

  static const Map<int, RenewalType> _renewalTypeMapping = {
    0: RenewalType.daily,
    1: RenewalType.weekly,
    2: RenewalType.monthly,
  };

  static const Map<int, PackageType> _packageTypeMapping = {
    0: PackageType.data,
    1: PackageType.voice,
    2: PackageType.other,
  };

  static double _jsonToDouble(dynamic value) {
    if (value is int) {
      return value.toDouble();
    } else if (value is double) {
      return value;
    } else {
      // Handle other types or null as needed
      return 0.0;
    }
  }
}