import 'package:flutter/material.dart';
import 'package:forui/theme.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:software_architecture_picker/architectures/model/architectures.dart';
import 'package:software_architecture_picker/architectures/viewmodel/architectures_viewmodel.dart';
import 'package:software_architecture_picker/home/view/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final providers = [
      ChangeNotifierProvider(
        create: (_) =>
            ArchitecturesViewmodel(architecturesModel: ArchitecturesModel()),
      ),
    ];
    final router = GoRouter(
      routes: [GoRoute(path: "/", builder: (_, _) => HomeScreen())],
    );
    final theme = FThemes.zinc.dark;

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
