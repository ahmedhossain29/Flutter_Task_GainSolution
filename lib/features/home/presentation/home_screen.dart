import 'package:flutter/material.dart';
import 'package:flutter_task_gain_solution/features/home/presentation/widgets/exit_dialog.dart';
import 'package:flutter_task_gain_solution/features/home/presentation/widgets/main_controller.dart';
import '../../contact/presentation/screens/contact_screen.dart';
import '../../profile/presentation/screen/profile_screen.dart';
import '../../ticket/presentation/screens/ticket_screen.dart';
import 'widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeController = MainController();
  late List<Widget> screens;

  @override
  void initState() {
    screens = [TicketScreen(), ContactScreen(), ProfileScreen()];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(context: context, builder: (context) => const ExitDialog());
        return true;
      },
      child: Scaffold(
        body: StreamBuilder<int>(
          initialData: 0,
          stream: _homeController.naveListener.stream,
          builder: (context, AsyncSnapshot<int> snapshot) {
            int item = snapshot.data ?? 0;
            return screens[item];
          },
        ),
        bottomNavigationBar: const MyBottomNavigationBar(),
      ),
    );
  }
}
