import 'package:flutter/material.dart';

import '../../../domain/entities/ticket.dart';
class TopBadge extends StatelessWidget {
  final TicketLabel label;

  const TopBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    switch (label) {
      case TicketLabel.newTicket:
        return _badge("New", const Color(0xFFE7F1FF), const Color(0xFF2F80ED));

      case TicketLabel.firstResponseOverdue:
        return _badge(
          "First response overdue",
          const Color(0xFFFFF3CD),
          const Color(0xFFF2994A),
        );

      case TicketLabel.customerResponded:
        return _badge(
          "Customer responded",
          const Color(0xFFEDE7FF),
          const Color(0xFF9B51E0),
        );

      case TicketLabel.none:
        return const SizedBox();
    }
  }

  Widget _badge(String text, Color bg, Color fg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: fg,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
