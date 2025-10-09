import 'package:flutter/material.dart';
import 'package:forui/theme.dart';
import 'package:provider/provider.dart';
import 'package:software_architecture_picker/core/providers.dart';
import 'package:software_architecture_picker/core/router.dart';
import 'package:software_architecture_picker/core/view/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp.router(
        routerConfig: router,
        theme: theme.toApproximateMaterialTheme(),
        builder: (_, child) => FAnimatedTheme(data: theme, child: child!),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
