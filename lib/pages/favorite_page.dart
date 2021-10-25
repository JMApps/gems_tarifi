import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gems_tarifi/widgets/app_settings.dart';
import 'package:gems_tarifi/widgets/favorite_list.dart';
import 'package:url_launcher/url_launcher.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({Key? key}) : super(key: key);

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
          'Избранное',
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
            icon: const Icon(
              Icons.apps,
              color: Colors.white,
            ),
            onPressed: () async {
              if (await canLaunch(
                  'https://apps.apple.com/ru/developer/imanil-binyaminov/id1564920953')) {
                await launch(
                    'https://apps.apple.com/ru/developer/imanil-binyaminov/id1564920953');
              } else {
                throw 'Could not launch';
              }
            },
          ),
        ],
      ),
      body: FavoriteList(),
    );
  }
}
