import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gems_tarifi/presentation/widgets/content_list.dart';

class ContentPage extends StatelessWidget {
  ContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/images/pearl_50.png',
          color: Colors.white,
          scale: 1.5,
        ),
        title: const Text(
          'Жемчужины Тарифи',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.brown[800],
        actions: [
          IconButton(
            splashRadius: 20,
            icon: Icon(
              CupertinoIcons.search,
            ),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        splashColor: Colors.purpleAccent,
        mini: true,
        child: Center(
          child: Icon(
            CupertinoIcons.arrow_2_squarepath,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          // Вызвать контроллер для перехода
        },
      ),
      body: CupertinoScrollbar(
        child: ContentList(),
      ),
    );
  }
}
