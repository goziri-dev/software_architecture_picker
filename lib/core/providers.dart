import 'package:provider/provider.dart';
import 'package:software_architecture_picker/architectures/model/architectures.dart';
import 'package:software_architecture_picker/architectures/viewmodel/architectures_viewmodel.dart';

final providers = [
  ChangeNotifierProvider(
    create: (_) =>
        ArchitecturesViewmodel(architecturesModel: ArchitecturesModel()),
  ),
];
