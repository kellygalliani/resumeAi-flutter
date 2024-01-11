// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromptListStruct extends BaseStruct {
  PromptListStruct({
    String? promptName,
    String? promptDescription,
  })  : _promptName = promptName,
        _promptDescription = promptDescription;

  // "promptName" field.
  String? _promptName;
  String get promptName => _promptName ?? '';
  set promptName(String? val) => _promptName = val;
  bool hasPromptName() => _promptName != null;

  // "promptDescription" field.
  String? _promptDescription;
  String get promptDescription => _promptDescription ?? '';
  set promptDescription(String? val) => _promptDescription = val;
  bool hasPromptDescription() => _promptDescription != null;

  static PromptListStruct fromMap(Map<String, dynamic> data) =>
      PromptListStruct(
        promptName: data['promptName'] as String?,
        promptDescription: data['promptDescription'] as String?,
      );

  static PromptListStruct? maybeFromMap(dynamic data) => data is Map
      ? PromptListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'promptName': _promptName,
        'promptDescription': _promptDescription,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'promptName': serializeParam(
          _promptName,
          ParamType.String,
        ),
        'promptDescription': serializeParam(
          _promptDescription,
          ParamType.String,
        ),
      }.withoutNulls;

  static PromptListStruct fromSerializableMap(Map<String, dynamic> data) =>
      PromptListStruct(
        promptName: deserializeParam(
          data['promptName'],
          ParamType.String,
          false,
        ),
        promptDescription: deserializeParam(
          data['promptDescription'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PromptListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PromptListStruct &&
        promptName == other.promptName &&
        promptDescription == other.promptDescription;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([promptName, promptDescription]);
}

PromptListStruct createPromptListStruct({
  String? promptName,
  String? promptDescription,
}) =>
    PromptListStruct(
      promptName: promptName,
      promptDescription: promptDescription,
    );
