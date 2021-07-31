import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gems_tarifi/data/database_query.dart';
import 'package:gems_tarifi/model/content_item.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  var _databaseQuery = DatabaseQuery();
  final _textController = TextEditingController();
  final _itemScrollController = ItemScrollController();

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FocusScopeNode _currentFocus = FocusScope.of(context);
    return Scaffold(
      appBar: AppBar(
        title: TextButton.icon(
          onPressed: null,
          icon: Transform.scale(
            scale: 0.8,
            child: Image.asset(
              'assets/images/pearl_50.png',
              color: Colors.blue,
            ),
          ),
          label: Text(
            'Жемчужины Тарифи',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.brown[800],
        bottom: PreferredSize(
          child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.brown[800],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              child: _buildSearch()),
          preferredSize: Size.fromHeight(50),
        ),
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.arrow_2_squarepath),
            onPressed: () {
              toIndex();
            },
          ),
        ],
      ),
      body: FutureBuilder<List>(
        future: _textController.text.isEmpty
            ? _databaseQuery.getAllContent()
            : _databaseQuery.getContentSearchResult(_textController.text),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? Scrollbar(
                  child: _buildContentList(snapshot),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  Widget _buildSearch() {
    return CupertinoTextField(
      controller: _textController,
      autocorrect: true,
      onChanged: (String text) {
        setState(() {});
      },
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
      ),
      prefix: Padding(
        padding: EdgeInsets.all(8),
        child: Icon(
          CupertinoIcons.search,
          color: Colors.brown[800],
        ),
      ),
      placeholder: 'Поиск...',
      placeholderStyle: TextStyle(color: Colors.brown[500]),
      style: TextStyle(fontFamily: 'Gilroy', color: Colors.brown[800]),
      clearButtonMode: OverlayVisibilityMode.editing,
    );
  }

  Widget _buildContentList(AsyncSnapshot snapshot) {
    return ScrollablePositionedList.builder(
      itemScrollController: _itemScrollController,
      itemCount: snapshot.data!.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildContentItem(snapshot.data![index]);
      },
    );
  }

  Widget _buildContentItem(ContentItem item) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(4),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Html(
              data: item.content,
              style: {
                '#': Style(
                  fontSize: FontSize(20),
                ),
              },
            ),
            Divider(
              height: 2,
              color: Colors.brown,
            ),
            _buildBottomButtons(item),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButtons(ContentItem item) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          '№ – ${item.id}',
          style: TextStyle(fontSize: 18, color: Colors.blue),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.doc_on_doc,
            color: Colors.blue,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.arrowshape_turn_up_right,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }

  toIndex() {
    var randomNumber = Random();
    _itemScrollController.scrollTo(
        index: randomNumber.nextInt(300),
        duration: Duration(milliseconds: 650),
        curve: Curves.easeInOutQuart);
  }
}
