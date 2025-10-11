import 'package:go_router/go_router.dart';
import 'package:software_architecture_picker/features/home/view/home_screen.dart';
import 'package:software_architecture_picker/features/suggestions/screens/suggestions_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: "/", builder: (_, _) => const HomeScreen()),
    GoRoute(
      path: "/suggestions",
      builder: (_, state) {
        final data = state.extra! as Set<String>;
        return SuggestionsScreen(data: data);
      },
    ),
  ],
);
