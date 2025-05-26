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

import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> onVideoComplete(String? videoLink) async {
  // try {
  //   final response = await http.post(
  //     Uri.parse('https://api.example.com/on-video-complete'),
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //     body: jsonEncode({
  //       'videoId': YoutubePlayer.convertUrlToId(videoLink!),
  //       'status': 'completed',
  //     }),
  //   );

  //   if (response.statusCode == 200) {
  //     print('API call successful: ${response.body}');
  //   } else {
  //     print('Failed to make API call: ${response.statusCode} ${response.body}');
  //   }
  // } catch (e) {
  //   print('Error during API call: $e');
  // }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
