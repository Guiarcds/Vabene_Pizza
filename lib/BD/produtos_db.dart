import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ProdutosDB {
  Database _db;

  get db async {
    _db = await _initDB();
    return _db;
  }

  _initDB() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'pizzaria.db');
    print(path);

    var db = openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    String sql =
        'create table produtos (id INTEGER PRIMARY KEY, img VARCHAR(500), nome VARCHAR(100), preco DOUBLE, descricao VARCHAR(500));';
    await db.execute(sql);

    sql =
        "INSERT INTO produtos VALUES (1, 'assets/img/arepa.png', 'Arepa', 5.00, 'Parece um taco tem um monte de coisa');";
    await db.execute(sql);
  }
}
