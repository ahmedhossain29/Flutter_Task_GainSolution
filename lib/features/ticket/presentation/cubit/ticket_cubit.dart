import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_gain_solution/features/ticket/presentation/cubit/ticket_state.dart';

import '../../domain/usecases/get_tickets.dart';

class TicketCubit extends Cubit<TicketState> {
  final GetTickets getTickets;

  TicketCubit(this.getTickets) : super(TicketInitial());

  Future<void> fetchTickets() async {
    emit(TicketLoading());
    try {
      final tickets = await getTickets();
      emit(TicketLoaded(tickets));
    } catch (_) {
      emit(TicketError());
    }
  }
}
