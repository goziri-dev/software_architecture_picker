import 'package:flutter/material.dart';
import 'package:software_architecture_picker/features/architectures/model/architectures.dart';

class ArchitecturesViewmodel extends ChangeNotifier {
  final ArchitecturesModel _architecturesModel;

  ArchitecturesViewmodel({required ArchitecturesModel architecturesModel})
    : _architecturesModel = architecturesModel;

  Map<String, Map<String, int>> get architectures =>
      _architecturesModel.architectures;

  List<String> get characteristics {
    var firstArchitecture = _architecturesModel.architectures.keys.first;
    var characteristics =
        _architecturesModel.architectures[firstArchitecture]!.keys;
    return characteristics.toList();
  }
}
