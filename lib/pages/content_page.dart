import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gems_tarifi/widgets/content_list.dart';
import 'package:gems_tarifi/widgets/search_container.dart';

class ContentPage extends StatelessWidget {
  ContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusScopeNode _currentFocus = FocusScope.of(context);
    return GestureDetector(
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          leading: Image.asset(
            'assets/images/pearl_50.png',
            color: Colors.blue,
            scale: 2,
          ),
          title: const Text(
            'Жемчужины Тарифи',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          elevation: 0,
          centerTitle: false,
          backgroundColor: Colors.brown[800],
          actions: [
            IconButton(
              icon: const Icon(CupertinoIcons.settings),
              onPressed: () {},
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
            SearchContainer(),
            Expanded(
              child: ContentList(),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          splashColor: Colors.brown,
          mini: true,
          child: Center(
            child: Icon(
              CupertinoIcons.arrow_2_squarepath,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            // toIndex() {
//   var randomNumber = Random();
//   _itemScrollController.scrollTo(
//       index: randomNumber.nextInt(300),
//       duration: Duration(milliseconds: 650),
//       curve: Curves.easeInOutQuart);
// }
          },
        ),
      ),
      onTap: () {
        if (!_currentFocus.hasPrimaryFocus) {
          _currentFocus.unfocus();
        }
      },
    );
  }
}
