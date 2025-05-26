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

import 'package:socket_io_client/socket_io_client.dart' as IO;

late IO.Socket socket;

Future connectSocket(
  bool send,
  String message,
) async {
  // Add your function code here!
  socket = IO.io(FFAppConstants.chatUrl.toString(), <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': false,
  });

  socket.connect();

  send ? sendMessage(message) : connectSocketD();
}

connectSocketD() {
  socket.on('connect', (_) {
    print('Connected to userId: ${FFAppState().userId}');
    socket.emit('authenticate', FFAppState().userId);
  });

  socket.on('disconnect', (_) {
    print('how are you');
  });

  socket.on('message-sent', (data) {
    print("dskfnhjasbfhjasbfhb");
  });

  socket.on('receive-message', (data) {
    print('Received message from server: ${data}');
    _addMessageToChat(data['content'], true);
  });

  socket.on('message-error', (error) {
    print('Error sending message: $error');
  });
}

Future<void> sendMessage(String message) async {
  final content = message.trim();
  if (content.isEmpty) return;

  print("dsnfhjbds");
  _addMessageToChat(message, false);

  socket.emit('user-send-message', {
    'content': content,
    'userId': FFAppState().userId,
    // 'adminId': adminId,
  });
}

void _addMessageToChat(String message, bool isAdmin) {
  FFAppState().update(() {
    FFAppState().messageList.add({
      "is_admin": isAdmin,
      "message": message,
      "createdAt": DateTime.now(),
    });
  });
}
