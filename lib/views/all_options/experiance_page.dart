import 'package:flutter/material.dart';

import '../../../../globals.dart';

class ExperiancePage extends StatefulWidget {
  const ExperiancePage({super.key});

  @override
  State<ExperiancePage> createState() => _ExperiancePageState();
}

class _ExperiancePageState extends State<ExperiancePage> {
  final _formKey = GlobalKey<FormState>();
  final companyNameController = TextEditingController();
  final schoolController = TextEditingController();
  final rolesController = TextEditingController();
  final dateJoinedController = TextEditingController();
  final dateExitController = TextEditingController();
  bool isPreviouslyEmployed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Experiance'),
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Company Name',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    TextFormField(
                      initialValue: Globals.company,
                      decoration: InputDecoration(
                        hintText: 'enter Company Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a company name';
                        }
                        return null;
                      },
                      onSaved: (value) => Globals.company = value!,
                    ),
                    SizedBox(height: 16.0),
                    const Text('School/College/Institute',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    TextFormField(
                      initialValue: Globals.collage,
                      decoration: InputDecoration(
                        hintText: 'School/College/Institute',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a School/College/Institute name';
                        }
                        return null;
                      },
                      onSaved: (value) => Globals.collage = value!,
                    ),
                    SizedBox(height: 16.0),
                    const Text('Roles ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    TextFormField(
                      initialValue: Globals.roles,
                      decoration: InputDecoration(
                        hintText: 'Roles (optional)',
                      ),
                      onSaved: (value) => Globals.roles = value!,
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Radio(
                          value: true,
                          groupValue: isPreviouslyEmployed,
                          onChanged: (value) {
                            setState(() {
                              isPreviouslyEmployed = value!;
                            });
                          },
                        ),
                        Text('Previously\nEmployed'),
                        Radio(
                          value: false,
                          groupValue: isPreviouslyEmployed,
                          onChanged: (value) {
                            setState(() {
                              isPreviouslyEmployed = value!;
                            });
                          },
                        ),
                        Text('Currently\nEmployed'),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Date Joined',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                TextFormField(
                                  initialValue: Globals.joineddate,
                                  decoration: InputDecoration(
                                    hintText: 'DD/MM/YYYY',
                                  ),
                                  keyboardType: TextInputType.datetime,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a joining date';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) =>
                                      Globals.joineddate = value!,
                                ),
                              ]),
                        ),
                        SizedBox(width: 16.0),
                        Visibility(
                          visible: isPreviouslyEmployed,
                          child: Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Date Exit',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                TextFormField(
                                  initialValue: Globals.exitdate,
                                  decoration: InputDecoration(
                                    hintText: 'DD/MM/YYYY',
                                  ),
                                  keyboardType: TextInputType.datetime,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a Exit date';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) => Globals.exitdate = value!,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
