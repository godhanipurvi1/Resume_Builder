import 'dart:io';

import 'package:flutter/Material.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../Globals.dart';

class ContectInfoPage extends StatefulWidget {
  const ContectInfoPage({super.key});

  @override
  State<ContectInfoPage> createState() => _ContectInfoPageState();
}

class _ContectInfoPageState extends State<ContectInfoPage> {
  int index = 0;
  bool hide = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void setIndex(int i) {
    index = i;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RESUME WORKSPACE'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setIndex(0);
                  },
                  child: Container(
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          topLeft: Radius.circular(16)),
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          width: index == 0 ? 5 : 0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    child: const Text(
                      "Contact",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setIndex(1);
                  },
                  child: Container(
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(16),
                          topRight: Radius.circular(16)),
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          width: index == 1 ? 5 : 0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    child: const Text(
                      "Photo",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: IndexedStack(
                    index: index,
                    children: [
                      // Contact Page
                      Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          padding: const EdgeInsets.all(12),
                          child: SingleChildScrollView(
                              child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  initialValue: Globals.name,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please enter name !!";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (value) => Globals.name = value!,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    labelText: "Name",
                                    hintText: "Enter name",
                                    prefixIcon: const Icon(Icons.person),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  initialValue: Globals.contact,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please enter number !!";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (value) => Globals.contact = value!,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    labelText: "Contact",
                                    hintText: "Enter number",
                                    prefixIcon: const Icon(Icons.phone),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  initialValue: Globals.address,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please enter address !!";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (value) => Globals.address = value!,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    labelText: "Address",
                                    hintText: "Enter address",
                                    prefixIcon: const Icon(Icons.home),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  initialValue: Globals.email,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please enter email !!";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (value) => Globals.email = value!,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    labelText: "Email",
                                    hintText: "Enter email",
                                    prefixIcon: const Icon(Icons.email),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  initialValue: Globals.password,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please enter password !!";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (value) => Globals.password = value!,
                                  obscureText: hide,
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    hintText: "Enter password",
                                    prefixIcon: const Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        hide = !hide;
                                        setState(() {});
                                      },
                                      icon: Icon(
                                        !hide
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                // Text("Name: ${nameController.text}"),
                                // Text("Contact: ${contactController.text}"),
                                // Text("Address: ${addressController.text}"),
                                // Text("Email: ${emailController.text}"),
                                // Text("Password: ${passwordController.text}"),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        formKey.currentState!.reset();
                                        Globals.password = Globals.contact =
                                            Globals.address = Globals.email =
                                                Globals.name = null;
                                        setState(() {});
                                      },
                                      child: const Text("RESET"),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        bool validated =
                                            formKey.currentState!.validate();

                                        if (validated) {
                                          formKey.currentState!.save();

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
                          ))),
                      Container(
                        color: Colors.white,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.25,
                        alignment: Alignment.center,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              foregroundImage: Globals.image != null
                                  ? FileImage(Globals.image!)
                                  : null,
                              child: const Text("add image"),
                            ),
                            FloatingActionButton.small(
                              onPressed: () async {
                                ImagePicker picker = ImagePicker();
                                XFile? file = await picker.pickImage(
                                    source: ImageSource.camera);
                                if (file != null) {
                                  setState(() {
                                    Globals.image = File(file.path);
                                  });
                                } else {
                                  print("FAILED !!!");
                                }
                              },
                              child: Icon(Icons.camera),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))),
        ]),
      ),
    );
  }
}
