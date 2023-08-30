import 'dart:io';

import 'package:flutter/services.dart';
import 'package:gems_tarifi/domain/models/citation_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initializeDatabase();
    return _db!;
  }

  DatabaseHelper.internal();

  Future<Database> initializeDatabase() async {
    Directory? documentDirectory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationSupportDirectory();

    String dbName = 'gems_db_4.db';

    String path = join(documentDirectory!.path, dbName);
    var exists = await databaseExists(path);

    String toDeleteDB = '${documentDirectory.path}/gems_db_3.db';

    var delDB = await databaseExists(toDeleteDB);

    if (delDB) {
      await deleteDatabase(toDeleteDB);
    }

    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {
        Exception('Invalid database');
      }

      ByteData data = await rootBundle.load(join('assets/databases', dbName));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }
    return await openDatabase(path);
  }

  Future<List<CitationModel>> getAllCitations() async {
    final Database dbClient = await db;
    var res = await dbClient.query('Table_of_content');
    List<CitationModel>? allCitations = res.isNotEmpty ? res.map((c) => CitationModel.fromMap(c)).toList() : null;
    return allCitations!;
  }

  Future<List<CitationModel>> getFavoriteSupplications({required List<int> favorites}) async {
    final Database dbClient = await db;
    var res = await dbClient.query('Table_of_content', where: 'id IN (${favorites.map((id) => '?').join(', ')})', whereArgs: favorites);
    List<CitationModel>? favoriteCitations = res.isNotEmpty ? res.map((c) => CitationModel.fromMap(c)).toList() : null;
    return favoriteCitations!;
  }
}
