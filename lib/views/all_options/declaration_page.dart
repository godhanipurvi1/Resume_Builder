import 'package:flutter/material.dart';

import '../../../globals.dart';

class Declaration extends StatefulWidget {
  const Declaration({super.key});

  @override
  State<Declaration> createState() => _DeclarationState();
}

class _DeclarationState extends State<Declaration> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Declaration'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Declaration',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Switch(
                      value: Globals.isChecked,
                      onChanged: (val) {
                        Globals.isChecked = val;
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Visibility(
                    visible: Globals.isChecked,
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 16.0),
                            Icon(
                              Icons.circle,
                              size: 40.0,
                            ),
                            SizedBox(height: 16.0),
                            const Text(
                              'Description',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            TextFormField(
                              initialValue: Globals.description,
                              decoration: InputDecoration(
                                hintText: 'Description',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a description';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                Globals.description = value!;
                              },
                            ),
                            SizedBox(height: 16.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Date',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      TextFormField(
                                        initialValue: Globals.date,
                                        decoration: InputDecoration(
                                          hintText: 'DD/MM/YYYY',
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter a date';
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          Globals.date = value!;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 16.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Place',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      TextFormField(
                                        initialValue: Globals.place,
                                        decoration: InputDecoration(
                                          hintText:
                                              'Place (Interview Venue/City)',
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter a place';
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          Globals.place = value!;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 32.0),
                            SizedBox(height: 16),
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
                                    bool validated =
                                        _formKey.currentState!.validate();

                                    if (validated) {
                                      _formKey.currentState!.save();

                                      SnackBar snackBar = const SnackBar(
                                        content: Text(
                                            "Form saved successfully... !!"),
                                        backgroundColor: Colors.white,
                                        behavior: SnackBarBehavior.floating,
                                      );

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    } else {
                                      SnackBar snackBar = const SnackBar(
                                        content: Text(
                                            "Form submission failed ... !!"),
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
                    ))
              ])),
        ),
      ),
    );
  }
}
