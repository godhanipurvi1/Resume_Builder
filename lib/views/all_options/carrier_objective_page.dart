import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../globals.dart';

class CarrierObjective extends StatefulWidget {
  const CarrierObjective({super.key});

  @override
  State<CarrierObjective> createState() => _CarrierObjectiveState();
}

class _CarrierObjectiveState extends State<CarrierObjective> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
              Icons.arrow_back), // Choose an icon that represents 'back' action
          onPressed: () {
            Navigator.pop(
                context); // Pops the current screen from the navigation stack
          },
        ),
        title: Text('Carrier Objective'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Career Objective',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      initialValue: Globals.descriptions,
                      decoration: InputDecoration(
                        hintText: 'Description',
                      ),
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                      onSaved: (value) => Globals.descriptions = value!,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Current Designation (Experienced Candidate)',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      initialValue: Globals.currentDesignation,
                      decoration: InputDecoration(
                        hintText: 'Software Engineer',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your current designation';
                        }
                        return null;
                      },
                      onSaved: (value) => Globals.currentDesignation = value!,
                    ),
                    Text("Name: ${Globals.descriptions}"),
                    Text("Contact: ${Globals.currentDesignation}"),
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
      ),
    );
  }
}
