import '../models/profile_model.dart';

class ProfileLocalDataSource {
  Future<ProfileModel> getProfile() async {
    await Future.delayed(const Duration(milliseconds: 600));

    return ProfileModel(
      firstName: "Jonaus",
      lastName: "Kahnwald",
      email: "Username@email.com",
      role: "Support",
      image: "https://i.pravatar.cc/150?img=12",
      roles: [
        RoleModel(
          title: "Manager",
          group: "Codecyaneon support",
          managerName: "Jonaus Kahnwald",
          managerImage: "https://i.pravatar.cc/150?img=12",
        ),
        RoleModel(
          title: "Agent",
          group: "Laravel team",
          managerName: "Noah",
          managerImage: "https://i.pravatar.cc/150?img=5",
        ),
      ],
    );
  }
}
