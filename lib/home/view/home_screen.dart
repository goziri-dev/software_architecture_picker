import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:software_architecture_picker/core/view/typography_util.dart';

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
              style: TypographyUtil.header(context),
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
              style: TypographyUtil.body(context),
            ),
          ],
        ),
      ),
    );
  }
}
