class ProfileEntity {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String password;
  final String? imagePath;

  ProfileEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    this.imagePath,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          email == other.email &&
          phone == other.phone &&
          password == other.password &&
          imagePath == other.imagePath;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      password.hashCode ^
      imagePath.hashCode;
}
