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

import 'package:fluttertoast/fluttertoast.dart';

Future toastUpper(
  BuildContext context,
  String text,
) async {
  // Add your function code here!
  CustomToast.showToast(context, text);

//  Fluttertoast.showToast(
  //   msg: text,
  //     toastLength: Toast.LENGTH_LONG,
  //    gravity: ToastGravity.TOP,
  //    timeInSecForIosWeb: 1,
  //   backgroundColor: Colors.black,
  //    textColor: Colors.white,
  //     fontSize: 12);
}

class CustomToast {
  static OverlayEntry?
      _currentOverlayEntry; // Store the current overlay entry to close it

  static void showToast(BuildContext context, String message) {
    // Remove the current toast if it exists to allow showing a new one
    _currentOverlayEntry?.remove();

    // Create a new overlay entry to display the toast
    _currentOverlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 80, // Position from the top of the screen
        left: MediaQuery.of(context).size.width * 0.05,
        right: MediaQuery.of(context).size.width * 0.05,
        child: Material(
          color: Colors.transparent,
          child: _buildToastContent(context, message),
        ),
      ),
    );

    // Insert the overlay entry into the Overlay
    Overlay.of(context)?.insert(_currentOverlayEntry!);

    // Automatically remove the toast after 2 seconds unless closed manually
    Future.delayed(Duration(seconds: 2)).then((_) {
      // Check if the toast still exists before removing
      if (_currentOverlayEntry?.mounted ?? false) {
        _currentOverlayEntry?.remove();
        _currentOverlayEntry = null; // Reset the current overlay entry
      }
    });
  }

  static Widget _buildToastContent(BuildContext context, String message) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Icon(
                Icons.check,
                color: FlutterFlowTheme.of(context).primaryBackground,
                size: 30.0,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                message,
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'SF Pro Display',
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      fontSize: 17,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: false,
                      lineHeight: 1.5,
                    ),
              ),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () {
                // Close the toast when "close" is tapped
                _currentOverlayEntry?.remove();
                _currentOverlayEntry = null; // Reset the current overlay entry
              },
              child: Text(
                'close',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'SF Pro Display',
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      fontSize: 17,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: false,
                      lineHeight: 1.5,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
