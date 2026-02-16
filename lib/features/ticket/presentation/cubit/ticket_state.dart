import '../../domain/entities/ticket.dart';

abstract class TicketState {}

class TicketInitial extends TicketState {}

class TicketLoading extends TicketState {}

class TicketLoaded extends TicketState {
  final List<Ticket> tickets;

  TicketLoaded(this.tickets);
}

class TicketError extends TicketState {}
