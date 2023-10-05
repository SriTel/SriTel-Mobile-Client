enum UnitOfMeasure { Gb, Minutes, Sms}

class Usage{
  final String title;
  final UnitOfMeasure unit;
  final double totalAmount;
  final double usage;

  Usage({
    required this.title,
    required this.unit,
    required this.totalAmount,
    required this.usage
});

  // conversion methods
  factory Usage.fromJson(Map<String, dynamic> json) {
    return Usage(
      title: json['title'],
      unit: _unitOfMeasureMapping[json['unit']] ?? UnitOfMeasure.Gb,
      totalAmount: _jsonToDouble(json['totalAmount']),
      usage: _jsonToDouble(json['usageAmount'])
    );
  }

  static const Map<int, UnitOfMeasure> _unitOfMeasureMapping = {
    0: UnitOfMeasure.Gb,
    1: UnitOfMeasure.Minutes,
    2: UnitOfMeasure.Sms,
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