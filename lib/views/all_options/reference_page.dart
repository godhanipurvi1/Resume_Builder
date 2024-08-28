import 'package:flutter/Material.dart';

import '../../../../globals.dart';

class RefrancePage extends StatefulWidget {
  const RefrancePage({super.key});

  @override
  State<RefrancePage> createState() => _RefrancePageState();
}

class _RefrancePageState extends State<RefrancePage> {
  final _formKey = GlobalKey<FormState>();
  final referenceNameController = TextEditingController();
  final designationController = TextEditingController();
  final organizationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Refrance"),
      ),
      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         const Text(
      //           "Reference Name",
      //           style: TextStyle(
      //             fontWeight: FontWeight.bold,
      //             fontSize: 16,
      //           ),
      //         ),
      //         const SizedBox(height: 8),
      //         TextField(
      //           decoration: const InputDecoration(
      //             hintText: "full name",
      //             border: OutlineInputBorder(),
      //           ),
      //         ),
      //         const SizedBox(height: 16),
      //         const Text(
      //           "Designation",
      //           style: TextStyle(
      //             fontWeight: FontWeight.bold,
      //             fontSize: 16,
      //           ),
      //         ),
      //         const SizedBox(height: 8),
      //         TextField(
      //           decoration: const InputDecoration(
      //             hintText: "Marketing Manager, ID-342332",
      //             border: OutlineInputBorder(),
      //           ),
      //         ),
      //         const SizedBox(height: 16),
      //         const Text(
      //           "Organization/Institute",
      //           style: TextStyle(
      //             fontWeight: FontWeight.bold,
      //             fontSize: 16,
      //           ),
      //         ),
      //         const SizedBox(height: 8),
      //         TextField(
      //           decoration: const InputDecoration(
      //             hintText: "Green Energy Pvt. Ltd",
      //             border: OutlineInputBorder(),
      //           ),
      //         ),
      //         const SizedBox(height: 16),
      //       ],
      //     ),
      //   ),
      // ),

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
                      'Reference Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      initialValue: Globals.referance,
                      // controller: referenceNameController,
                      decoration: const InputDecoration(
                        hintText: 'Enter Reference Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter reference name';
                        }
                        return null;
                      },
                      onSaved: (value) => Globals.referance = value!,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Designation',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      initialValue: Globals.Designation,
                      //controller: designationController,
                      decoration: const InputDecoration(
                        hintText: 'Enter Designation',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter designation';
                        }
                        return null;
                      },
                      onSaved: (value) => Globals.Designation = value!,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Organization/Institute',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      initialValue: Globals.Organization,
                      // controller: organizationController,
                      decoration: const InputDecoration(
                        hintText: 'Enter Organization/Institute',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter organization/institute';
                        }
                        return null;
                      },
                      onSaved: (value) => Globals.Organization = value!,
                    ),
                    const SizedBox(height: 32),
                    Text('Reference Name: ${referenceNameController.text}'),
                    Text('Designation: ${designationController.text}'),
                    Text('Organization: ${organizationController.text}'),
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
