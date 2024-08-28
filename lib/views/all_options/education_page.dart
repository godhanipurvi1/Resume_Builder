import 'package:flutter/material.dart';

import '../../../../globals.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  final _formKey = GlobalKey<FormState>();
  final cgpaController = TextEditingController();
  final yearController = TextEditingController();
  final courseController = TextEditingController();
  final schoolController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Education'),
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
                    'Course/Degree',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    initialValue: Globals.course,
                    //controller: courseController,
                    decoration: const InputDecoration(
                      hintText: 'Enter Course/Degree',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your course/degree';
                      }
                      return null;
                    },
                    onSaved: (value) => Globals.course = value!,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'School/College/Institute',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    initialValue: Globals.school,
                    // controller: schoolController,
                    decoration: const InputDecoration(
                      hintText: 'Enter School/College/Institute',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your school/college/institute';
                      }
                      return null;
                    },
                    onSaved: (value) => Globals.school = value!,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'CGPA/SGPA',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    initialValue: Globals.cgpa,
                    //controller: cgpaController,
                    decoration: const InputDecoration(
                      hintText: 'Enter CGPA or percentage',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your CGPA or percentage';
                      }
                      return null;
                    },
                    onSaved: (value) => Globals.cgpa = value!,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Year Of Pass',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    initialValue: Globals.year,
                    //controller: yearController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Enter Year Of Pass',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your year of pass';
                      }
                      return null;
                    },
                    onSaved: (value) => Globals.year = value!,
                  ),
                  const SizedBox(height: 32),
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
