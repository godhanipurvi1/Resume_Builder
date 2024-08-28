import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

import '../Globals.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfPage extends StatefulWidget {
  const PdfPage({super.key});

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  Future<Uint8List> getPdf() async {
    // 1. Generate object
    pw.Document pdf = pw.Document();

    // 2. Add and design Page
    pdf.addPage(
      pw.Page(
        margin: const pw.EdgeInsets.all(25),
        build: (pw.Context cnt) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Container(
              padding: const pw.EdgeInsets.all(16),
              color: PdfColors.grey200,
              child: pw.Row(
                children: [
                  if (Globals.image != null)
                    pw.Image(
                      pw.MemoryImage(Globals.image!.readAsBytesSync()),
                      width: 80,
                      height: 80,
                    ),
                  pw.SizedBox(width: 10),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        Globals.name ?? "Name Not Provided",
                        style: pw.TextStyle(
                          fontSize: 24,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        Globals.email ?? "Email Not Provided",
                        style: const pw.TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      pw.Text(
                        Globals.contact ?? "Contact Not Provided",
                        style: const pw.TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    // 3. Save pdf
    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF Page"),
      ),
      body: PdfPreview(
        pdfFileName: "RESUME_${Globals.name?.toUpperCase()}",
        build: (format) => getPdf(),
      ),
    );
  }
}
