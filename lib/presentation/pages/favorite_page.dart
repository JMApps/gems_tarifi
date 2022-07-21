import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gems_tarifi/presentation/widgets/favorite_list.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        leading: Image.asset(
          'assets/images/pearl_50.png',
          color: Colors.white,
          scale: 1.5,
        ),
        title: const Text(
          'Избранное',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: CupertinoScrollbar(
        child: FavoriteList(),
      ),
    );
  }
}
