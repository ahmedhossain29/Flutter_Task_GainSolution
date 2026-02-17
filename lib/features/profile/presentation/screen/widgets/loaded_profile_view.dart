import 'package:flutter/material.dart';
import 'package:flutter_task_gain_solution/core/common_widgets/custom_text.dart';
import 'package:flutter_task_gain_solution/core/utils/app_color.dart';
import 'package:flutter_task_gain_solution/core/utils/utils.dart';

import '../../../../../core/common_widgets/bordered_avatar.dart';
import '../../../domain/entities/profile.dart';

class LoadedProfileView extends StatelessWidget {
  final Profile profile;

  const LoadedProfileView({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            /// header
            Container(
              padding: const EdgeInsets.all(16),
              color: const Color(0xFFE6F6FC),
              child: Row(
                children: [
                  BorderedAvatar(imageUrl: profile.image, radius: 28),
                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "${profile.firstName} ${profile.lastName}",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        CustomText(text: profile.role, color: Colors.grey),
                      ],
                    ),
                  ),

                  const Icon(Icons.edit),
                ],
              ),
            ),

            /// body
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: "Basic info",
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF797979),
                  ),
                  Utils.verticalSpace(16.0),

                  _info("First name", profile.firstName),
                  _info("Last name", profile.lastName),
                  _info("Email", profile.email),

                  Utils.verticalSpace(24.0),

                  /// Assigned roles
                  CustomText(
                    text: "Assigned roles (${profile.roles.length})",
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF797979),
                  ),

                  Utils.verticalSpace(16.0),

                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: profile.roles.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (_, i) {
                        final role = profile.roles[i];
                        return _RoleCard(role: role);
                      },
                    ),
                  ),

                  Utils.verticalSpace(30.0),

                  /// Logout button
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8D7DA),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.logout,color: redColor,),
                        Utils.horizontalSpace(20.0),
                        CustomText(
                          text: "Log out",
                          fontSize: 16.0,
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _info(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: label, color: Colors.grey),
          Utils.verticalSpace(4.0),
          CustomText(text: value, fontSize: 16, fontWeight: FontWeight.w600),
        ],
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  final Role role;

  const _RoleCard({required this.role});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: role.title,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),

          Utils.verticalSpace(8.0),
          const Divider(),
          Utils.verticalSpace(8.0),

          const CustomText(text: "Group", color: Colors.grey),
          CustomText(
            text: role.group,
            fontWeight: FontWeight.w600,
            color: Color(0xFF797979),
          ),

          Utils.verticalSpace(8.0),

          const CustomText(text: "Manager", color: Colors.grey),
          Utils.verticalSpace(8.0),

          Row(
            children: [
              BorderedAvatar(
                imageUrl: role.managerImage,
                radius: 12,
                borderWidth: 2,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: CustomText(
                  text: role.managerName,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF797979),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
