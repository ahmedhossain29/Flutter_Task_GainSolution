import '../entities/ticket.dart';
import '../repositories/ticket_repository.dart';

class GetTickets {
  final TicketRepository repository;

  GetTickets(this.repository);

  Future<List<Ticket>> call() {
    return repository.getTickets();
  }
}
