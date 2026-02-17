class Role {
  final String title;
  final String group;
  final String managerName;
  final String managerImage;

  Role({
    required this.title,
    required this.group,
    required this.managerName,
    required this.managerImage,
  });
}

class Profile {
  final String firstName;
  final String lastName;
  final String email;
  final String role;
  final String image;
  final List<Role> roles; // ← important

  Profile({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
    required this.image,
    required this.roles,
  });
}

