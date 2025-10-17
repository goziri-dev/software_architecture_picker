import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:software_architecture_picker/app.dart';
import 'package:aptabase_flutter/aptabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Aptabase.init("A-EU-6641500779");
  usePathUrlStrategy();
  runApp(const App());
}
