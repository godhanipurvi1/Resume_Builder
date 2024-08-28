import 'package:flutter/material.dart';

import '../../../../globals.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  final _formKey = GlobalKey<FormState>();

  List<String> availableTechnologies = [
    "c programing",
    "C++",
    "Flutter",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projects'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Project Title',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  TextFormField(
                    initialValue: Globals.projectTitle,
                    decoration: InputDecoration(hintText: "Project Title"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a project title";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      Globals.projectTitle = value;
                    },
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    "Technologies",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  ...availableTechnologies.map(
                    (e) => CheckboxListTile(
                      title: Text(e),
                      value: Globals.Technologies.contains(e),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (val) {
                        if (val!) {
                          Globals.Technologies.add(e);
                        } else {
                          Globals.Technologies.remove(e);
                        }
                        setState(() {});
                      },
                    ),
                  ),
                  SizedBox(height: 16.0),
                  const Text(
                    'Roles',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  TextFormField(
                    initialValue: Globals.roles,
                    decoration: InputDecoration(hintText: "Roles"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your role";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      Globals.roles = value;
                    },
                  ),
                  SizedBox(height: 16.0),
                  const Text(
                    'Number of Programmers',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  TextFormField(
                    initialValue: Globals.numProgrammers.toString(),
                    decoration:
                        InputDecoration(hintText: "Number of Programmers"),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter the number of programmers";
                      }
                      if (int.tryParse(value) == null) {
                        return "Please enter a valid number";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      Globals.numProgrammers = int.parse(value!);
                    },
                  ),
                  SizedBox(height: 16.0),
                  const Text(
                    'Project Description',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  TextFormField(
                    initialValue: Globals.projectDescription,
                    decoration:
                        InputDecoration(hintText: "Project Description"),
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a project description";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      Globals.projectDescription = value;
                    },
                  ),
                  SizedBox(height: 32.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _formKey.currentState!.reset();
                          setState(() {});
                        },
                        child: const Text("RESET"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          bool validated = _formKey.currentState!.validate();

                          if (validated) {
                            _formKey.currentState!.save();

                            SnackBar snackBar = const SnackBar(
                              content: Text("Form saved successfully... !!"),
                              backgroundColor: Colors.white,
                              behavior: SnackBarBehavior.floating,
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            SnackBar snackBar = const SnackBar(
                              content: Text("Form submission failed ... !!"),
                              backgroundColor: Colors.white,
                              behavior: SnackBarBehavior.floating,
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                          setState(() {});
                        },
                        child: const Text("SAVE"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
