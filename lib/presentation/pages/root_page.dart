import 'package:flutter/material.dart';
import 'package:gems_tarifi/application/strings/app_strings.dart';
import 'package:gems_tarifi/presentation/pages/main_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      home: MainPage(),
    );
  }
}
