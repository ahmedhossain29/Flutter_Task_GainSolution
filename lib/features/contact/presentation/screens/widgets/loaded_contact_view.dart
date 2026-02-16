import 'package:flutter/material.dart';
import 'package:flutter_task_gain_solution/core/utils/app_color.dart';
import 'package:flutter_task_gain_solution/features/contact/presentation/screens/widgets/contact_header.dart';
import '../../../../../core/common_widgets/bordered_avatar.dart';
import '../../../../../core/common_widgets/custom_text.dart';
import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/contact.dart';

class LoadedContactView extends StatelessWidget {
  final List<Contact> contacts;

  const LoadedContactView({super.key, required this.contacts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.symmetric(h: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContactHeader(),
          Utils.verticalSpace(20.0),
          TextField(
            decoration: InputDecoration(
              hintText: "Search contacts",
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Color(0xFFF3F4F8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
            //  onChanged: (v) => setState(() => searchText = v.toLowerCase()),
          ),
          Utils.verticalSpace(20.0),
          const CustomText(
            text: "124 tickets",
            color: Colors.grey,
            fontSize: 14.0,
          ),
          Utils.verticalSpace(20.0),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(0.0),
              itemCount: contacts.length,
              itemBuilder: (_, i) => ContactCard(contact: contacts[i]),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final Contact contact;

  const ContactCard({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              BorderedAvatar(
                imageUrl: contact.image,
                radius: 22,
                borderWidth: 3,
              ),

              const SizedBox(width: 12),

              Expanded(
                child: CustomText(
                  text: contact.name,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              PopupMenuButton(
                color: whiteColor,
                icon: const Icon(Icons.more_vert),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                itemBuilder:
                    (context) => const [
                      PopupMenuItem(child: Text("Edit")),
                      PopupMenuItem(child: Text("View tickets")),
                      PopupMenuItem(child: Text("Delete")),
                    ],
              ),
            ],
          ),

          Utils.verticalSpace(12.0),

          _InfoRow(icon: Icons.email_outlined, text: contact.email),
          Utils.verticalSpace(4.0),

          _InfoRow(icon: Icons.phone_in_talk_rounded, text: contact.phone),
          Utils.verticalSpace(4.0),

          _InfoRow(icon: Icons.location_on_outlined, text: contact.address),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),

        Utils.horizontalSpace(4.0),
        Expanded(
          child: CustomText(
            text: text,
            color: Color(0xFF797979),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
