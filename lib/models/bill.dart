import 'package:SriTel/widgets/bill_widget.dart';

class Bill{
  final int id;
  final int serviceId;
  final double dataServiceCharge;
  final double dataRoamingCharge;
  final double voiceRoamingCharge;
  final double voiceServiceCharge;
  final double ringingToneCharge;
  final double packageCharge;
  final String packageName;
  final double dataAddOnCharge;
  final double extraGbCharge;
  final double dueAmount;
  final double taxAmount;
  final double paidAmount;
  final double totalAmount;

  Bill({
    required this.id,
    required this.serviceId,
    required this.dataServiceCharge,
    required this.dataRoamingCharge,
    required this.voiceServiceCharge,
    required this.voiceRoamingCharge,
    required this.ringingToneCharge,
    required this.packageCharge,
    required this.packageName,
    required this.dataAddOnCharge,
    required this.extraGbCharge,
    this.dueAmount = 0,
    this.taxAmount = 0,
    this.paidAmount = 0,
    required this.totalAmount
});

  // conversion methods
  factory Bill.fromJson(Map<String, dynamic> json) {
    return Bill(
      id: json['billId'],
      serviceId: json['serviceId'],
      dataServiceCharge: _jsonToDouble(json['dataServiceCharge']),
      voiceServiceCharge: _jsonToDouble(json['voiceServiceCharge']),
      dataRoamingCharge: _jsonToDouble(json['dataRoamingCharge']),
      voiceRoamingCharge: _jsonToDouble(json['voiceRoamingCharge']),
      ringingToneCharge: _jsonToDouble(json['ringingToneCharge']),
      packageCharge: _jsonToDouble(json['packageCharge']),
      packageName: json['packageName'],
      dataAddOnCharge: _jsonToDouble(json['dataAddOnCharge']),
      extraGbCharge: _jsonToDouble(json['extraGbCharge']),
      dueAmount: _jsonToDouble(json['dueAmount']),
      taxAmount: _jsonToDouble(json['taxAmount']),
      paidAmount: _jsonToDouble(json['paidAmount']),
      totalAmount: _jsonToDouble(json['totalAmount']),
    );
  }
  
  List<BillEntry> dataBillEntries(){
    List<BillEntry> entries = <BillEntry>[];
    if(dataServiceCharge != 0) entries.add(BillEntry(title: 'Data Service', charge: dataServiceCharge));
    if(packageCharge != 0) entries.add(BillEntry(title: packageName, charge: packageCharge));
    if(dataRoamingCharge != 0) entries.add(BillEntry(title: 'Data Roaming', charge: dataRoamingCharge));
    if(dataAddOnCharge != 0) entries.add(BillEntry(title: 'AddOns', charge: dataAddOnCharge));
    if(extraGbCharge != 0) entries.add(BillEntry(title: 'Extra GB', charge: extraGbCharge));

    return entries;
  }

  List<BillEntry> voiceBillEntries(){
    List<BillEntry> entries = <BillEntry>[];
    if(voiceServiceCharge != 0) entries.add(BillEntry(title: 'Voice Service', charge: voiceServiceCharge));
    if(packageCharge != 0) entries.add(BillEntry(title: packageName, charge: packageCharge));
    if(voiceRoamingCharge != 0) entries.add(BillEntry(title: 'Voice Roaming', charge: voiceRoamingCharge));
    if(ringingToneCharge != 0) entries.add(BillEntry(title: 'Ringing Tone', charge: ringingToneCharge));

    return entries;
  }

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