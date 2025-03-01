class UserModel {
  final String identifier;
  final String givenName;
  final String familyName;
  final String email;

  UserModel({
    required this.identifier,
    required this.givenName,
    required this.familyName,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      identifier: json['identifier'],
      givenName: json['givenName'],
      familyName: json['familyName'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'identifier': identifier,
      'givenName': givenName,
      'familyName': familyName,
      'email': email,
    };
  }
}