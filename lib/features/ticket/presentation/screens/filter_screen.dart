import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_gain_solution/features/ticket/presentation/screens/widgets/loaded_filter_view.dart';
import '../../../../core/di/injector.dart';
import '../cubit/filter_cubit.dart';
import '../cubit/filter_state.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<FilterCubit>()..fetchFilters(),
      child: const _FilterView(),
    );
  }
}

class _FilterView extends StatelessWidget {
  const _FilterView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Filters"),
        actions: const [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text("Apply"),
          )
        ],
      ),
      body: BlocBuilder<FilterCubit, FilterState>(
        builder: (_, state) {
          if (state is FilterLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is FilterError) {
            return const Center(child: Text("Failed to load filters"));
          }

          if (state is FilterLoaded) {
            return LoadedFilterView(data: state.data);
          }

          return const SizedBox();
        },
      ),
    );
  }
}



