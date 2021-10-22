import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gems_tarifi/widgets/app_settings.dart';
import 'package:gems_tarifi/widgets/category_drop_down_list.dart';
import 'package:gems_tarifi/widgets/category_list.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        leading: Image.asset(
          'assets/images/pearl_50.png',
          color: Colors.blue,
          scale: 2,
        ),
        title: const Text(
          'Категории',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.brown[800],
        actions: [
          IconButton(
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                builder: (BuildContext context) {
                  return const AppSettings();
                },
              );
            },
            icon: const Icon(
              CupertinoIcons.settings,
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: const Icon(CupertinoIcons.info),
            onPressed: () {
              Navigator.of(context).pushNamed('/about_us');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          CategoryDropdownList(),
          Expanded(
            child: CategoryList(),
          ),
        ],
      ),
    );
  }
}
