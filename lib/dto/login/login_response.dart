class LoginResponse{
  int id;
  String firstName;
  String lastName;
  String mobileNumber;
  String email;
  String image;
  String nic;
  String jwtToken;

  LoginResponse({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.email,
    required this.image,
    required this.nic,
    required this.jwtToken
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    id: json["id"],
    firstName: json["firstName"],
      lastName: json["lastName"],
      mobileNumber: json["mobileNumber"],
      email: json["email"],
      image: json["image"],
      nic: json["nic"],
      jwtToken: json['jwtToken'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName" : firstName,
    "lastName" : lastName,
    "mobileNumber" : mobileNumber,
    "email" : email,
    "image" : image,
    "nic": nic,
    "jwtToken": jwtToken,
  };
}