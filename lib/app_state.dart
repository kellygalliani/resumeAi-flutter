import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _promptListState = prefs
              .getStringList('ff_promptListState')
              ?.map((x) {
                try {
                  return PromptListStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _promptListState;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<PromptListStruct> _promptListState = [];
  List<PromptListStruct> get promptListState => _promptListState;
  set promptListState(List<PromptListStruct> _value) {
    _promptListState = _value;
    prefs.setStringList(
        'ff_promptListState', _value.map((x) => x.serialize()).toList());
  }

  void addToPromptListState(PromptListStruct _value) {
    _promptListState.add(_value);
    prefs.setStringList('ff_promptListState',
        _promptListState.map((x) => x.serialize()).toList());
  }

  void removeFromPromptListState(PromptListStruct _value) {
    _promptListState.remove(_value);
    prefs.setStringList('ff_promptListState',
        _promptListState.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromPromptListState(int _index) {
    _promptListState.removeAt(_index);
    prefs.setStringList('ff_promptListState',
        _promptListState.map((x) => x.serialize()).toList());
  }

  void updatePromptListStateAtIndex(
    int _index,
    PromptListStruct Function(PromptListStruct) updateFn,
  ) {
    _promptListState[_index] = updateFn(_promptListState[_index]);
    prefs.setStringList('ff_promptListState',
        _promptListState.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInPromptListState(int _index, PromptListStruct _value) {
    _promptListState.insert(_index, _value);
    prefs.setStringList('ff_promptListState',
        _promptListState.map((x) => x.serialize()).toList());
  }

  String _dropdownSelected = '';
  String get dropdownSelected => _dropdownSelected;
  set dropdownSelected(String _value) {
    _dropdownSelected = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
