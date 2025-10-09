import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;

    return FScaffold(
      header: FHeader(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Text(
              "Architecture Characteristics",
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Select your software needs.")],
        ),
      ),
    );
  }
}
