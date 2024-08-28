import 'package:flutter/material.dart';

import '../../../../globals.dart';

class IntrestAndHobbiesPage extends StatefulWidget {
  const IntrestAndHobbiesPage({super.key});

  @override
  State<IntrestAndHobbiesPage> createState() => _IntrestAndHobbiesPageState();
}

class _IntrestAndHobbiesPageState extends State<IntrestAndHobbiesPage> {
  List<TextEditingController> allControllers = [];
  @override
  void initState() {
    if (Globals.intrest_hobbies.isEmpty) {
      allControllers = List.generate(
        2,
        (i) => TextEditingController(),
      );
    } else if (Globals.intrest_hobbies.length < 2) {
      Globals.intrest_hobbies.forEach((e) {
        allControllers.add(
          TextEditingController(text: e),
        );
      });
      allControllers.add(TextEditingController());
    } else {
      Globals.intrest_hobbies.forEach((e) {
        allControllers.add(
          TextEditingController(text: e),
        );
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    Globals.intrest_hobbies.clear();
    for (int i = 0; i < allControllers.length; i++) {
      if (allControllers[i].text.isNotEmpty) {
        Globals.intrest_hobbies.add(allControllers[i].text);
      }
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
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
                      'Enter your intrest/hobbies',
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
