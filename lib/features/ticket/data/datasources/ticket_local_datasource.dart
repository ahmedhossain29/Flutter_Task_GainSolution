import '../models/ticket_model.dart';

class TicketLocalDataSource {
  Future<List<TicketModel>> getTickets() async {
    await Future.delayed(const Duration(seconds: 1));

    final data = [
      {
        "id": "132198423",
        "title": "Search view, which can display dynamic suggestions...",
        "user": "Michale",
        "date": "23 Dec 2023 03:43 pm",
        "tags": ["Low", "Open"],
        "label": "new"
      },
      {
        "id": "132198424",
        "title": "Ticket subject small",
        "user": "Noah",
        "date": "23 Dec 2023 03:43 pm",
        "tags": ["Urgent", "Open", "Spam"],
        "label": "first_response_overdue"
      },
      {
        "id": "132198425",
        "title": "Search view, which can display dynamic suggestions...",
        "user": "Jonus",
        "date": "23 Dec 2023 03:43 pm",
        "tags": ["Open"],
        "label": "customer_responded"
      },
      {
        "id": "132198426",
        "title": "Search view, which can display dynamic suggestions...",
        "user": "Michale",
        "date": "23 Dec 2023 03:43 pm",
        "tags": ["Low", "Open"],
        "label": "new"
      },
    ];

    return data.map((e) => TicketModel.fromJson(e)).toList();
  }
}
