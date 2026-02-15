import 'package:flutter/material.dart';
import 'core/routes/app_routes.dart';
import 'core/utils/app_color.dart';
import 'features/home/presentation/widgets/fetch_error_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gain Solutions',
      initialRoute: AppRoutes.homeScreen,
      onGenerateRoute: AppRoutes.generateRoutes,
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: FetchErrorText(
                text: 'No route defined for ${settings.name}',
                textColor: redColor),
          ),
        );
      },
    );
  }
}
