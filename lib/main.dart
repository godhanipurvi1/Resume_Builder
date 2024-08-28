import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume_a/views/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.grey,
    ),
  );

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[350],
      ),
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
    );
  }
}
