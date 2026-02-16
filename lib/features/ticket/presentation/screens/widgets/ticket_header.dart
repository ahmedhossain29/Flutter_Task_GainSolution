import 'package:flutter/material.dart';
import 'package:flutter_task_gain_solution/core/common_widgets/custom_text.dart';

import '../../../../../core/routes/page_transition.dart';
import '../../../../../core/utils/utils.dart';
import '../filter_screen.dart';

class TicketHeader extends StatelessWidget {
  const TicketHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 50, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title + notification
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: "Gain Solutions",
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),

              /// Notification icon with badge
              Stack(
                children: [
                  const Icon(Icons.notifications_none, size: 28),

                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: const CustomText(text:
                        "3",
                        color: Colors.white, fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          Utils.verticalSpace(20.0),

          /// Ticket count + filter
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: "124 tickets",
                color: Colors.grey,
                fontSize: 14.0,
              ),

              /// Filter icon
              GestureDetector(
                onTap: () => _openFilter(context),
                child: const Icon(Icons.filter_alt_outlined),
              ),
            ],
          ),
          Utils.verticalSpace(16.0),
        ],
      ),
    );
  }

  void _openFilter(BuildContext context) {
    Navigator.of(context).push(slideFromRight(const FilterScreen()));
  }
}
