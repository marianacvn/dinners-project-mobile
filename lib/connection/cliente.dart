import 'dart:convert';

import 'package:http/http.dart' as http;

class Cliente {
  String baseUrl = "http://192.168.0.101:8000/api/cliente/";

  Future<List> listarCliente() async {
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
