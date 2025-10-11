import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:provider/provider.dart';
import 'package:software_architecture_picker/features/architectures/viewmodel/architectures_viewmodel.dart';

class ArchitectureSelector extends StatelessWidget {
  const ArchitectureSelector({
    required this.hint,
    required this.controller,
    required this.validator,
    required this.popoverWidth,
    super.key,
  });

  final FMultiSelectController<String> controller;
  final Widget hint;
  final String? Function(Set<String>) validator;
  final double popoverWidth;

  @override
  Widget build(BuildContext context) {
    var architecturesState = context.watch<ArchitecturesViewmodel>();
    var characteristics = architecturesState.characteristics;
    return FMultiSelect<String>.searchBuilder(
      controller: controller,
      validator: validator,
      hint: hint,
      keepHint: false,
      format: (characteristic) => Text(characteristic),
      clearable: true,
      filter: (query) => query.isEmpty
          ? characteristics
          : characteristics.where((c) => c.startsWith(query.toLowerCase())),
      popoverConstraints: FPortalConstraints(
        maxHeight: 200,
        maxWidth: popoverWidth,
      ),
      contentBuilder: (_, _, characteristics) => [
        for (final characteristic in characteristics)
          FSelectItem(title: Text(characteristic), value: characteristic),
      ],
    );
  }
}
