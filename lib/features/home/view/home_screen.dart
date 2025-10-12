import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:software_architecture_picker/core/view/utils/media_util.dart';
import 'package:software_architecture_picker/core/view/utils/typography_util.dart';
import 'package:software_architecture_picker/features/home/custom/architecture_selector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final _characteristicsController = FMultiSelectController<String>(
    vsync: this,
  );

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _characteristicsController.dispose();
    super.dispose();
  }

  String? _validateCharacteristics(Set<String> characteristics) {
    if (characteristics.isEmpty) {
      return "Please select needs";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var multiSelectWidth = MediaUtil.scaleToDevice(context, 0.25);
    return FScaffold(
      header: SafeArea(
        child: FHeader(
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Text(
              "Architecture Characteristics",
              style: TypographyUtil.header(context),
            ),
          ),
        ),
      ),
      child: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const Expanded(child: SizedBox(height: 20)),
                SizedBox(
                  width: multiSelectWidth,
                  child: ArchitectureSelector(
                    controller: _characteristicsController,
                    hint: const Text("Select your software needs"),
                    validator: _validateCharacteristics,
                    popoverWidth: multiSelectWidth,
                  ),
                ),
                const Expanded(child: SizedBox(height: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10,
                      ),
                      child: SizedBox(
                        width: multiSelectWidth / 3,
                        child: FButton(
                          mainAxisSize: MainAxisSize.max,
                          onPress: () {
                            if (_formKey.currentState!.validate()) {
                              context.push(
                                "/suggestions",
                                extra: _characteristicsController.value,
                              );
                            }
                          },
                          child: const Text("Next"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
