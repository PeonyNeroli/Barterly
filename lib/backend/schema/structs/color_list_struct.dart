// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ColorListStruct extends FFFirebaseStruct {
  ColorListStruct({
    String? id,
    Color? color,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _color = color,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  static ColorListStruct fromMap(Map<String, dynamic> data) => ColorListStruct(
        id: data['id'] as String?,
        color: getSchemaColor(data['color']),
      );

  static ColorListStruct? maybeFromMap(dynamic data) => data is Map
      ? ColorListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'color': _color,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
      }.withoutNulls;

  static ColorListStruct fromSerializableMap(Map<String, dynamic> data) =>
      ColorListStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'ColorListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ColorListStruct && id == other.id && color == other.color;
  }

  @override
  int get hashCode => const ListEquality().hash([id, color]);
}

ColorListStruct createColorListStruct({
  String? id,
  Color? color,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ColorListStruct(
      id: id,
      color: color,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ColorListStruct? updateColorListStruct(
  ColorListStruct? colorList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    colorList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addColorListStructData(
  Map<String, dynamic> firestoreData,
  ColorListStruct? colorList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (colorList == null) {
    return;
  }
  if (colorList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && colorList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final colorListData = getColorListFirestoreData(colorList, forFieldValue);
  final nestedData = colorListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = colorList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getColorListFirestoreData(
  ColorListStruct? colorList, [
  bool forFieldValue = false,
]) {
  if (colorList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(colorList.toMap());

  // Add any Firestore field values
  colorList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getColorListListFirestoreData(
  List<ColorListStruct>? colorLists,
) =>
    colorLists?.map((e) => getColorListFirestoreData(e, true)).toList() ?? [];
