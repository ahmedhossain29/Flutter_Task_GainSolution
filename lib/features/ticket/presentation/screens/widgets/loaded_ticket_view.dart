import 'package:flutter/material.dart';
import 'package:flutter_task_gain_solution/core/common_widgets/custom_text.dart';
import 'package:flutter_task_gain_solution/features/ticket/presentation/screens/widgets/ticket_header.dart';
import 'package:flutter_task_gain_solution/features/ticket/presentation/screens/widgets/top_badge_widget.dart';

import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/ticket.dart';

class LoadedTicketView extends StatelessWidget {
  final List<Ticket> tickets;

  const LoadedTicketView({super.key, required this.tickets});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        const TicketHeader(),

        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: tickets.length,
            itemBuilder: (_, i) {
              final t = tickets[i];
              return TicketCard(ticket: t);
            },
          ),
        ),
      ],
    );
  }
}

class TicketCard extends StatelessWidget {
  final Ticket ticket;

  const TicketCard({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 TOP BADGE
          TopBadge(label: ticket.label),

          if (ticket.label != TicketLabel.none) const SizedBox(height: 8),

          /// ID
          CustomText(
            text: "#ID ${ticket.id}",
            color: Color(0xFFB7B7B7),
            fontSize: 11.0,
            fontWeight: FontWeight.w500,
          ),

          Utils.verticalSpace(8.0),

          /// TITLE
          CustomText(
            text: ticket.title,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            maxLine: 2,
          ),

          Utils.verticalSpace(8.0),

          /// USER + DATE
          CustomText(text:
            "${ticket.user}  •  ${ticket.date}",
            color: Colors.grey,
          ),

          Utils.verticalSpace(8.0),
          Container(
            width: double.infinity,
            height: 0.5,
            color: Color(0xFFD8E0ED),
          ),
          Utils.verticalSpace(12.0),
          /// TAGS WITH DOT
          Wrap(
            spacing: 8,
            children:
                ticket.tags.map((tag) {
                  return _TagChip(label: tag);
                }).toList(),
          ),
        ],
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  final String label;

  const _TagChip({required this.label});

  Color get dotColor {
    switch (label.toLowerCase()) {
      case 'low':
        return Colors.green;
      case 'urgent':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color:Color(0xFFD8E0ED)),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// DOT
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(right: 6),
            decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
          ),

          Text(label),
        ],
      ),
    );
  }
}
