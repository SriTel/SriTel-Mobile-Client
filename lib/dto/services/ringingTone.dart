class RingingToneDTO{
  String ringingToneName;

  RingingToneDTO({
    required this.ringingToneName,
  });

  Map<String, dynamic> toJson() => {
    "ringingToneName" : ringingToneName,
  };
}