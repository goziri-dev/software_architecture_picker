import 'package:flutter/material.dart';
import 'package:software_architecture_picker/modules/architectures/model/architectures.dart';

class ArchitecturesViewmodel extends ChangeNotifier {
  final ArchitecturesModel _architecturesModel;

  ArchitecturesViewmodel({required ArchitecturesModel architecturesModel})
    : _architecturesModel = architecturesModel;
}
