import 'dart:convert';
import 'package:http/http.dart' as http;
import '../domain/endereco.dart';

class CepApi {
  Future<CepValidate> useUrl(String cep) async {
    String url = 'https://viacep.com.br/ws/$cep/json/';

    var response = await http.get(url);
    var lista = jsonDecode(response.body);
    var createobj = CepValidate.fromJson(lista);

    return createobj;
  }
}
