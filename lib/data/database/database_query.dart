import 'package:gems_tarifi/data/database/database_helper.dart';
import 'package:gems_tarifi/data/model/content_model_item.dart';

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
    var res = await dbClient.query('Table_of_content', where: 'favorite_state == 1');
    List<ContentModelItem>? favoriteContent = res.isNotEmpty ? res.map((c) => ContentModelItem.fromMap(c)).toList() : null;
    return favoriteContent!;
  }

  addRemoveFavorite(int state, int _id) async {
    var dbClient = await con.db;
    await dbClient.rawQuery('UPDATE Table_of_content SET favorite_state = $state WHERE id == $_id');
  }
}
