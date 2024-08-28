import 'package:flutter/material.dart';
import 'package:resume_a/Screens/pdf_page.dart';

import '../views/app_routes.dart';

class BuildOptionPage extends StatefulWidget {
  const BuildOptionPage({super.key});

  @override
  State<BuildOptionPage> createState() => _BuildOptionPageState();
}

class _BuildOptionPageState extends State<BuildOptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
            children: AppRoutes.allOptions
                .map((e) => ListTile(
                    leading: Image.asset(e['icon'], height: 25),
                    title: Text(e['title']),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                            //(context),
                            e['route']);
                      },
                      icon: Icon(Icons.arrow_right),
                    )))
                .toList()),
      ),
    );
  }
}
