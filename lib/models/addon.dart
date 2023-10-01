
enum AddOnType { extraGb, other}

class Addon {
  final int id;
  final String name;
  final AddOnType type;
  final String image;
  final String description;
  final int validNoOfDays;
  final double chargePerGb;
  final double dataAmount;

  Addon({
    required this.id,
    required this.name,
    required this.type,
    required this.image,
    required this.description,
    required this.validNoOfDays,
    required this.chargePerGb,
    required this.dataAmount,
  });

  // conversion methods
  factory Addon.fromJson(Map<String, dynamic> json) {
    return Addon(
      id: json['id'],
      name: json['name'],
      type: _packageTypeMapping[json['type']] ?? AddOnType.extraGb,
      description: json['description'],
      image: json['image'],
      validNoOfDays: json['validNoOfDays'],
      chargePerGb: _jsonToDouble(json['chargePerGb']),
      dataAmount: _jsonToDouble(json['dataAmount']),
    );
  }

  static const Map<int, AddOnType> _packageTypeMapping = {
    0: AddOnType.extraGb,
    1: AddOnType.other,
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