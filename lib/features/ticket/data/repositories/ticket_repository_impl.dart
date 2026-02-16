import '../../domain/entities/ticket.dart';
import '../../domain/repositories/ticket_repository.dart';
import '../datasources/ticket_local_datasource.dart';

class TicketRepositoryImpl implements TicketRepository {
  final TicketLocalDataSource localDataSource;

  TicketRepositoryImpl(this.localDataSource);

  @override
  Future<List<Ticket>> getTickets() {
    return localDataSource.getTickets();
  }
}
