import 'dart:convert';

import 'package:http/http.dart' as http;

class Produto {
  String baseUrl = "http://127.0.0.1:8000/api/produto/";

  Future<List> listarPrdouto() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Erro de servidor');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
