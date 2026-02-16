import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_gain_solution/core/utils/app_color.dart';
import 'package:flutter_task_gain_solution/features/contact/presentation/screens/widgets/loaded_contact_view.dart';

import '../../../../core/di/injector.dart';
import '../cubit/contact_cubit.dart';
import '../cubit/contact_state.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ContactCubit>()..fetchContacts(),
      child: const _ContactView(),
    );
  }
}
class _ContactView extends StatelessWidget {
  const _ContactView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: BlocBuilder<ContactCubit, ContactState>(
        builder: (_, state) {
          if (state is ContactLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ContactError) {
            return const Center(child: Text("Failed to load contacts"));
          }

          if (state is ContactLoaded) {
            return LoadedContactView(contacts: state.contacts);
          }

          return const SizedBox();
        },
      ),
    );
  }
}


