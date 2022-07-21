import 'package:flutter/material.dart';
import 'package:gems_tarifi/presentation/widgets/settings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/images/pearl_50.png',
          color: Colors.white,
          scale: 1.5,
        ),
        title: const Text('Настройки'),
      ),
      body: Settings(),
    );
  }
}
