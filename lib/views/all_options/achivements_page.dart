import 'package:flutter/material.dart';

import '../../../../globals.dart';

class achievementsPage extends StatefulWidget {
  const achievementsPage({super.key});

  @override
  State<achievementsPage> createState() => _achievementsPageState();
}

class _achievementsPageState extends State<achievementsPage> {
  List<TextEditingController> allControllers = [];
  @override
  void initState() {
    if (Globals.achievements.isEmpty) {
      allControllers = List.generate(
        2,
        (i) => TextEditingController(),
      );
    } else if (Globals.achievements.length < 2) {
      Globals.achievements.forEach((e) {
        allControllers.add(
          TextEditingController(text: e),
        );
      });
      allControllers.add(TextEditingController());
    } else {
      Globals.achievements.forEach((e) {
        allControllers.add(
          TextEditingController(text: e),
        );
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    Globals.achievements.clear();
    for (int i = 0; i < allControllers.length; i++) {
      if (allControllers[i].text.isNotEmpty) {
        Globals.achievements.add(allControllers[i].text);
      }
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Achivements Page')),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(children: [
                    Text(
                      'Enter your achivements',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Column(
                      children: List.generate(
                          allControllers.length,
                          (i) => Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: allControllers[i],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      allControllers[i].clear();
                                      allControllers.removeAt(i);
                                      setState(() {});
                                    },
                                    icon: Icon(Icons.delete_outline),
                                  ),
                                ],
                              )),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () {
                        allControllers.add(TextEditingController());
                        setState(() {});
                      },
                      icon: const Icon(Icons.add),
                      label: const Text("add"),
                    ),
                  ]))),
        ));
  }
}
