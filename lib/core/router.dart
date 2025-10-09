import 'package:go_router/go_router.dart';
import 'package:software_architecture_picker/modules/home/view/home_screen.dart';

final router = GoRouter(
  routes: [GoRoute(path: "/", builder: (_, _) => HomeScreen())],
);
