// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VideoPlayerOrWebView extends StatefulWidget {
  const VideoPlayerOrWebView({
    super.key,
    this.width,
    this.height,
    this.videoUrl,
  });

  final double? width;
  final double? height;
  final String? videoUrl;

  @override
  State<VideoPlayerOrWebView> createState() => _VideoPlayerOrWebViewState();
}

class _VideoPlayerOrWebViewState extends State<VideoPlayerOrWebView> {
  @override
  Widget build(BuildContext context) {
    if (widget.videoUrl!.endsWith(".mp4")) {
      debugPrint(" is mp4 ----VideoPlayerScreen");
      return VideoPlayerScreen(videoUrl: widget.videoUrl!);
    } else {
      final WebViewController webViewController = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(widget.videoUrl!));

      return WebViewWidget(controller: webViewController);
    }
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({super.key, required this.videoUrl});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(
                _controller,
              ),
            )
          : const CircularProgressIndicator(),
    );
  }
}
