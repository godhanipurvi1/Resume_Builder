import 'package:flutter/Material.dart';

import '../../../../globals.dart';

class TechnicaSkillsPage extends StatefulWidget {
  const TechnicaSkillsPage({super.key});

  @override
  State<TechnicaSkillsPage> createState() => _TechnicaSkillsPageState();
}

class _TechnicaSkillsPageState extends State<TechnicaSkillsPage> {
  List<TextEditingController> allControllers = [];
  @override
  void initState() {
    if (Globals.technicalSkills.isEmpty) {
      allControllers = List.generate(
        2,
        (i) => TextEditingController(),
      );
    } else if (Globals.technicalSkills.length < 2) {
      Globals.technicalSkills.forEach((e) {
        allControllers.add(
          TextEditingController(text: e),
        );
      });
      allControllers.add(TextEditingController());
    } else {
      Globals.technicalSkills.forEach((e) {
        allControllers.add(
          TextEditingController(text: e),
        );
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    Globals.technicalSkills.clear();
    for (int i = 0; i < allControllers.length; i++) {
      if (allControllers[i].text.isNotEmpty) {
        Globals.technicalSkills.add(allControllers[i].text);
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
                      'Enter your technicalSkills',
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
