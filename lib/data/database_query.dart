import 'package:gems_tarifi/data/database_helper.dart';
import 'package:gems_tarifi/model/content_model_item.dart';

class DatabaseQuery {
  DatabaseHelper con = DatabaseHelper();

  Future<List<ContentModelItem>> getAllContent() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_content');
    List<ContentModelItem>? mainContent = res.isNotEmpty ? res.map((c) => ContentModelItem.fromMap(c)).toList() : null;
    return mainContent!;
  }

  Future<List<ContentModelItem>> getFavoriteContent() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_content', where: 'favorite == 1');
    List<ContentModelItem>? favoriteContent = res.isNotEmpty ? res.map((c) => ContentModelItem.fromMap(c)).toList() : null;
    return favoriteContent!;
  }

  Future<List<ContentModelItem>> getContentSearchResult(String text) async {
    var dbClient = await con.db;
    var res = await dbClient.rawQuery("SELECT * FROM Table_of_content WHERE _id LIKE '%$text%' OR content LIKE '%$text%'");
    List<ContentModelItem>? searchResult = res.isNotEmpty ? res.map((c) => ContentModelItem.fromMap(c)).toList() : null;
    return searchResult!;
  }

  addRemoveFavorite(int state, int _id) async {
    var dbClient = await con.db;
    await dbClient.rawQuery('UPDATE Table_of_content SET favorite = $state WHERE _id == $_id');
  }
}
