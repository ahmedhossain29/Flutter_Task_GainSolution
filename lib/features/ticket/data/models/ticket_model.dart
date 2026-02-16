import '../../domain/entities/ticket.dart';

class TicketModel extends Ticket {
  TicketModel({
    required super.id,
    required super.title,
    required super.user,
    required super.date,
    required super.tags,
    required super.label,
  });



  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      id: json['id'],
      title: json['title'],
      user: json['user'],
      date: json['date'],
      tags: List<String>.from(json['tags']),
      label: _mapLabel(json['label']),

    );
  }
}

TicketLabel _mapLabel(String? value) {
  switch (value) {
    case 'new':
      return TicketLabel.newTicket;
    case 'first_response_overdue':
      return TicketLabel.firstResponseOverdue;
    case 'customer_responded':
      return TicketLabel.customerResponded;
    default:
      return TicketLabel.none;
  }
}
