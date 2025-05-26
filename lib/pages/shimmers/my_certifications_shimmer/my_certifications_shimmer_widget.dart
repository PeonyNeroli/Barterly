import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'my_certifications_shimmer_model.dart';
export 'my_certifications_shimmer_model.dart';

class MyCertificationsShimmerWidget extends StatefulWidget {
  const MyCertificationsShimmerWidget({super.key});

  @override
  State<MyCertificationsShimmerWidget> createState() =>
      _MyCertificationsShimmerWidgetState();
}

class _MyCertificationsShimmerWidgetState
    extends State<MyCertificationsShimmerWidget> {
  late MyCertificationsShimmerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyCertificationsShimmerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      child: Builder(
        builder: (context) {
          final certificateList = List.generate(
              random_data.randomInteger(4, 6),
              (index) => random_data.randomString(
                    0,
                    0,
                    true,
                    false,
                    false,
                  )).toList();

          return Wrap(
            spacing: 16.0,
            runSpacing: 16.0,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.start,
            verticalDirection: VerticalDirection.down,
            clipBehavior: Clip.antiAlias,
            children:
                List.generate(certificateList.length, (certificateListIndex) {
              final certificateListItem = certificateList[certificateListIndex];
              return Container(
                width: () {
                  if (MediaQuery.sizeOf(context).width < 810.0) {
                    return ((MediaQuery.sizeOf(context).width - 48) * 1 / 2);
                  } else if ((MediaQuery.sizeOf(context).width >= 810.0) &&
                      (MediaQuery.sizeOf(context).width < 1280.0)) {
                    return ((MediaQuery.sizeOf(context).width - 80) * 1 / 4);
                  } else if (MediaQuery.sizeOf(context).width >= 1280.0) {
                    return ((MediaQuery.sizeOf(context).width - 112) * 1 / 6);
                  } else {
                    return ((MediaQuery.sizeOf(context).width - 112) * 1 / 6);
                  }
                }(),
                height: 300.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 194.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).grey100,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 16.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).grey100,
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 24.0,
                                  height: 24.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 24.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).grey100,
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                          ].divide(SizedBox(height: 2.0)),
                        ),
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
