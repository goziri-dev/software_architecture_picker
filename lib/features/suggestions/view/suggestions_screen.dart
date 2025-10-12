import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:software_architecture_picker/core/view/utils/typography_util.dart';
import 'package:software_architecture_picker/features/architectures/viewmodel/architectures_viewmodel.dart';
import 'package:software_architecture_picker/features/suggestions/view/suggestions_display.dart';

class SuggestionsScreen extends StatefulWidget {
  const SuggestionsScreen({required this.data, super.key});

  final Set<String> data;

  @override
  State<SuggestionsScreen> createState() => _SuggestionsScreenState();
}

class _SuggestionsScreenState extends State<SuggestionsScreen> {
  Map<String, Map<String, int>> _filteredArchitectures(
    Map<String, Map<String, int>> architectures,
  ) {
    var architecturesScore = <String, int>{};

    for (var entry in architectures.entries) {
      var score = 0;
      for (var characteristic in widget.data) {
        score += entry.value[characteristic] ?? 0;
      }
      architecturesScore[entry.key] = score;
    }

    final maxScore = architecturesScore.values.reduce((a, b) => a > b ? a : b);

    final filtered = Map.fromEntries(
      architectures.entries.where(
        (entry) => architecturesScore[entry.key] == maxScore,
      ),
    );

    return filtered;
  }

  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var architecturesState = context.watch<ArchitecturesViewmodel>();
    var architectures = architecturesState.architectures;
    var filteredArchitectures = _filteredArchitectures(architectures);

    return FScaffold(
      header: FHeader.nested(
        prefixes: [
          if (!kIsWeb) FHeaderAction.back(onPress: () => context.pop()),
        ],
      ),
      child: SafeArea(
        child: Column(
          children: [
            Text(
              "Suggested Architectures",
              style: TypographyUtil.header(context),
            ),
            const Expanded(child: SizedBox()),
            Expanded(
              flex: 3,
              child: Scrollbar(
                controller: _scrollController,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (var architecture in filteredArchitectures.entries)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              SuggestionsDisplay(
                                architectureName: architecture.key,
                                architectureCharacteristics: architecture.value,
                                selectedCharacteristics: widget.data,
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
