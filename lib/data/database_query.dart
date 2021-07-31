import 'package:gems_tarifi/data/database_helper.dart';
import 'package:gems_tarifi/model/content_item.dart';

class DatabaseQuery {
  DatabaseHelper con = DatabaseHelper();

  Future<List<ContentItem>> getAllContent() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_content');
    List<ContentItem>? mainContent = res.isNotEmpty ? res.map((c) => ContentItem.fromMap(c)).toList() : null;
    return mainContent!;
  }

  Future<List<ContentItem>> getFavoriteContent() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_content', where: 'favorite == 1');
    List<ContentItem>? favoriteContent = res.isNotEmpty ? res.map((c) => ContentItem.fromMap(c)).toList() : null;
    return favoriteContent!;
  }

  Future<List<ContentItem>> getContentSearchResult(String text) async {
    var dbClient = await con.db;
    var res = await dbClient.rawQuery("SELECT * FROM Table_of_content WHERE _id LIKE '%$text%' OR content LIKE '%$text%'");
    List<ContentItem>? searchResult = res.isNotEmpty ? res.map((c) => ContentItem.fromMap(c)).toList() : null;
    return searchResult!;
  }

  addRemoveFavorite(int state, int _id) async {
    var dbClient = await con.db;
    await dbClient.rawQuery('UPDATE Table_of_content SET favorite = $state WHERE _id == $_id');
  }
}
