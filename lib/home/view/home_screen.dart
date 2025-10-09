import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:software_architecture_picker/core/view/media_util.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Text(
              "Architecture Characteristics",
              style: TextStyle(
                fontSize: MediaUtil.scaleText(context, 0.05),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Select your software needs.",
              style: TextStyle(fontSize: MediaUtil.scaleText(context, 0.02)),
            ),
          ],
        ),
      ),
    );
  }
}
