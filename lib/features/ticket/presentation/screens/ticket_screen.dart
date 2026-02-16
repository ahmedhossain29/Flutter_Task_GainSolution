import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_gain_solution/core/common_widgets/custom_text.dart';
import 'package:flutter_task_gain_solution/core/utils/app_color.dart';
import 'package:flutter_task_gain_solution/features/ticket/presentation/screens/widgets/loaded_ticket_view.dart';
import '../../../../core/di/injector.dart';
import '../../../../core/utils/utils.dart';
import '../cubit/ticket_cubit.dart';
import '../cubit/ticket_state.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TicketCubit>()..fetchTickets(),
      child: const _TicketView(),
    );
  }
}

class _TicketView extends StatelessWidget {
  const _TicketView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: BlocBuilder<TicketCubit, TicketState>(
        builder: (_, state) {
          if (state is TicketLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is TicketError) {
            return const Center(child: Text("Something went wrong"));
          }

          if (state is TicketLoaded) {
            return LoadedTicketView(tickets: state.tickets);
          }

          return const SizedBox();
        },
      ),
    );
  }
}
