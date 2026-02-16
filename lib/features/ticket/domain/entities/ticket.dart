enum TicketLabel {
  newTicket,
  firstResponseOverdue,
  customerResponded,
  none,
}

class Ticket {
  final String id;
  final String title;
  final String user;
  final String date;
  final List<String> tags;
  final TicketLabel label;

  Ticket({
    required this.id,
    required this.title,
    required this.user,
    required this.date,
    required this.tags,
    required this.label,
  });
}

