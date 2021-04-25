import 'package:pizzaria_app/domain/produto.dart';
import 'package:sqflite/sqflite.dart';

import 'produtos_db.dart';

class ProdutosDao {
  String tableName = 'produtos';

  Future<List<Produto>> obterProdutos() async {
    Database db = await ProdutosDB().db;

    String sql = 'SELECT * FROM $tableName';
    List<Map<String, dynamic>> result = await db.rawQuery(sql);
    List<Produto> listaProduto = <Produto>[];

    for (var jsonProduto in result) {
      listaProduto.add(Produto.fromJson(jsonProduto));
    }

    return listaProduto;
  }
}
