class SignUpResponse{
  int id;
  String firstName;
  String lastName;
  String mobileNumber;
  String email;
  String nic;

  SignUpResponse({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.email,
    required this.nic,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
    id: json["id"],
    firstName: json["firstName"],
      lastName: json["lastName"],
      mobileNumber: json["mobileNumber"],
      email: json["email"],
      nic: json["nic"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName" : firstName,
    "lastName" : lastName,
    "mobileNumber" : mobileNumber,
    "email" : email,
    "nic": nic,
  };
}