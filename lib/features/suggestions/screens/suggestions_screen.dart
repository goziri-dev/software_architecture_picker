import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

class SuggestionsScreen extends StatelessWidget {
  const SuggestionsScreen({required this.data, super.key});

  final Set<String> data;

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader.nested(
        prefixes: [
          if (!kIsWeb) FHeaderAction.back(onPress: () => context.pop()),
        ],
      ),
      child: const Placeholder(),
    );
  }
}
