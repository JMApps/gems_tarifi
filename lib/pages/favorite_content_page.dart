import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gems_tarifi/data/database_query.dart';
import 'package:gems_tarifi/model/content_item.dart';
import 'package:share/share.dart';

class FavoriteContentPage extends StatefulWidget {
  const FavoriteContentPage({Key? key}) : super(key: key);

  @override
  _FavoriteContentPageState createState() => _FavoriteContentPageState();
}

class _FavoriteContentPageState extends State<FavoriteContentPage> {
  var _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
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
            'Избранное',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.brown[800],
      ),
      body: FutureBuilder<List>(
        future: _databaseQuery.getFavoriteContent(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? Scrollbar(
                  child: _buildContentList(snapshot),
                )
              : Center(
                  child: TextButton.icon(
                    onPressed: null,
                    icon: Icon(
                      CupertinoIcons.bookmark_fill,
                      color: Colors.blue,
                    ),
                    label: Text(
                      'Список избранного пуст',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                );
        },
      ),
    );
  }

  Widget _buildContentList(AsyncSnapshot snapshot) {
    return ListView.builder(
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
        TextButton.icon(
          onPressed: null,
          icon: Image.asset(
            'assets/images/pearl_50.png',
            color: Colors.blue,
            scale: 1.5,
          ),
          label: Text('– ${item.id}',
              style: TextStyle(fontSize: 18, color: Colors.blue)),
        ),
        IconButton(
          icon: Icon(
            CupertinoIcons.doc_on_doc,
            color: Colors.blue,
          ),
          onPressed: () {
            FlutterClipboard.copy(
                    '${item.contentForShare}\n\n‘Абду-ль-‘Азиз ат-Тарифи')
                .then((value) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.blue,
                  content: Text(
                    'Скопировано',
                    style: TextStyle(fontSize: 18),
                  ),
                  duration: Duration(milliseconds: 500),
                ),
              );
            });
          },
        ),
        IconButton(
          icon: Icon(
            CupertinoIcons.arrowshape_turn_up_right,
            color: Colors.blue,
          ),
          onPressed: () {
            Share.share('${item.contentForShare}\n\n‘Абду-ль-‘Азиз ат-Тарифи');
          },
        ),
      ],
    );
  }
}
