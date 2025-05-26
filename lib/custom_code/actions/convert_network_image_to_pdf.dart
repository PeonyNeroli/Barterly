// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';

Future convertNetworkImageToPdf(String imageUrl) async {
  // Add your function code here!
  try {
    // Download the image from the network
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      final imageBytes = response.bodyBytes;

      // Create a PDF document
      final pdf = pw.Document();

      // Add the downloaded image to the PDF document
      final image = pw.MemoryImage(imageBytes);
      pdf.addPage(pw.Page(build: (pw.Context context) {
        return pw.Center(
          child: pw.Image(image),
        );
      }));

      // Get the application's document directory
      final outputDir = await getApplicationDocumentsDirectory();
      final outputFilePath = "${outputDir.path}/network_image.pdf";

      // Write the PDF file to the output path
      final outputFile = File(outputFilePath);
      await outputFile.writeAsBytes(await pdf.save());

      // Open the generated PDF file
      OpenFile.open(outputFilePath);
    } else {
      print('Failed to download image from $imageUrl');
    }
  } catch (e) {
    print('Error: $e');
  }
}
