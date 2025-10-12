import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:software_architecture_picker/core/view/utils/typography_util.dart';

class SuggestionsDisplay extends StatelessWidget {
  const SuggestionsDisplay({
    required this.architectureName,
    required this.architectureCharacteristics,
    required this.selectedCharacteristics,
    super.key,
  });

  final String architectureName;
  final Map<String, int> architectureCharacteristics;
  final Set<String> selectedCharacteristics;

  @override
  Widget build(BuildContext context) {
    var filteredArchitectureCharactersitics = architectureCharacteristics
        .entries
        .where((element) => selectedCharacteristics.contains(element.key));

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          architectureName.toUpperCase(),
          style: TypographyUtil.medium(context),
        ),
        const SizedBox(height: 10),
        for (var characteristic in filteredArchitectureCharactersitics)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: SizedBox(
              width: 500,
              child: FTile(
                prefix: Text(
                  characteristic.key,
                  style: TypographyUtil.body(context),
                ),
                title: Text(characteristic.key),
                suffix: Row(
                  children: [
                    for (var i = 0; i < characteristic.value; i++)
                      const Icon(Icons.star, color: Colors.yellow),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
