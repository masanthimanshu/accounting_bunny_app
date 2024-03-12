class ProfileModel {
  final String name;
  final String email;
  final String company;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool emailVerified;

  ProfileModel({
    required this.name,
    required this.email,
    required this.company,
    required this.createdAt,
    required this.updatedAt,
    required this.emailVerified,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json["name"],
      email: json["email"],
      company: json["company"],
      emailVerified: json["emailVerified"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }
}
