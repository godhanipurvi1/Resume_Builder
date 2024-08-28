import 'package:flutter/material.dart';
import 'package:resume_a/Screens/pdf_page.dart';

import 'build_option_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(''),
          leading: IconButton(
            icon: Icon(Icons.picture_as_pdf), // Replace with the desired icon
            iconSize: 24,
            color: Colors.blue,
            onPressed: () {
              // Navigate to another page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PdfPage()),
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BuildOptionPage()));
        },
      ),
    );
  }
}
