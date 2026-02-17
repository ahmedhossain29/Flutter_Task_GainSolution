import '../../domain/entities/profile.dart';

class RoleModel extends Role {
  RoleModel({
    required super.title,
    required super.group,
    required super.managerName,
    required super.managerImage,
  });
}

class ProfileModel extends Profile {
  ProfileModel({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.role,
    required super.image,
    required super.roles,
  });
}

