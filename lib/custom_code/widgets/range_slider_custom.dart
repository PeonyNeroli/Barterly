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

import 'index.dart'; // Imports other custom widgets

// Imports custom actions

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

import 'package:range_slider_flutter/range_slider_flutter.dart';

class RangeSliderCustom extends StatefulWidget {
  const RangeSliderCustom({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<RangeSliderCustom> createState() => _RangeSliderCustomState();
}

class _RangeSliderCustomState extends State<RangeSliderCustom> {
  @override
  Widget build(BuildContext context) {
    return RangeSliderFlutter(
      // key: Key('3343'),
      values: [FFAppState().lowerPrice, FFAppState().highPrice],

      rangeSlider: true,
      tooltip: RangeSliderFlutterTooltip(
        custom: (value) => Container(),
        alwaysShowTooltip: true,
        rightPrefix: Text("\$"),
        leftPrefix: Text("\$"),
      ),
      max: 200,
      textPositionTop: -100,
      handlerHeight: 27,
      textColor: Colors.black,
      trackBar: RangeSliderFlutterTrackBar(
        activeTrackBarHeight: 4,
        inactiveTrackBarHeight: 4,
        activeTrackBar: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: FlutterFlowTheme.of(context).primary,
        ),
        inactiveTrackBar: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: FlutterFlowTheme.of(context).davysGrey,
        ),
      ),
      // handler: RangeSliderFlutterHandler(
      //   decoration: BoxDecoration(
      //     color: Colors.yellow,
      //     borderRadius: BorderRadius.circular(10),
      //   ),
      // ),
      min: 0,
      fontSize: 15,

      onDragging: (handlerIndex, lowerValue, upperValue) {
        FFAppState().update(() {
          FFAppState().lowerPrice = lowerValue;
          FFAppState().highPrice = upperValue;
        });
      },
    );
  }
}
