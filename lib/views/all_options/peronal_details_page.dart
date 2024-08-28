import 'package:flutter/material.dart';

import '../../../../globals.dart';

class PesonalDetails extends StatefulWidget {
  const PesonalDetails({super.key});

  @override
  State<PesonalDetails> createState() => _PesonalDetailsState();
}

class _PesonalDetailsState extends State<PesonalDetails> {
  final _formKey = GlobalKey<FormState>();
  List<String> availableLanguages = [
    "Hindi",
    "English",
    "Gujarati",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PERSONAL DETAILS"),
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
                  const Text('DOB',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextFormField(
                    initialValue: Globals.dob,
                    decoration: const InputDecoration(
                      hintText: 'DD/MM/YYYY',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Date of Birth';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      Globals.dob = value;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  const Text('Marital Status',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Radio(
                        value: 'Single',
                        groupValue: Globals.maritalStatus,
                        onChanged: (value) {
                          setState(() {
                            Globals.maritalStatus = value;
                          });
                        },
                      ),
                      const Text('Single'),
                      Radio(
                        value: 'Married',
                        groupValue: Globals.maritalStatus,
                        onChanged: (value) {
                          setState(() {
                            Globals.maritalStatus = value;
                          });
                        },
                      ),
                      const Text('Married'),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  const Text('Languages Known',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ...availableLanguages.map(
                    (e) => CheckboxListTile(
                      title: Text(e),
                      value: Globals.languages.contains(e),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (val) {
                        if (val!) {
                          Globals.languages.add(e);
                        } else {
                          Globals.languages.remove(e);
                        }
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text('Nationality',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextFormField(
                    initialValue: Globals.nationality,
                    decoration: const InputDecoration(
                      hintText: 'Indian',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Nationality';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      Globals.nationality = value;
                    },
                  ),
                  Text('DOB: ${Globals.dob}'),
                  Text('Marital Status: ${Globals.maritalStatus}'),
                  Text('Languages: ${Globals.languages}'),
                  Text('Nationality: ${Globals.nationality}'),
                  const SizedBox(height: 10.0),
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
                      ])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
