import 'dart:convert';

import 'package:http/http.dart' as http;

class Pedido {
  String baseUrl = "http://10.0.2.2:8000/api/pedido/";

  Future<List> listarPedido() async {
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

  Future<bool> enviarPedido(int mesa, int cliente, List<int> produto) async {
    final http.Response response = await http.post(Uri.parse(baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'mesa': mesa,
          'cliente': cliente,
          'produto': produto,
        }));
    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Não foi possível carregar os pedidos');
    }
  }
}
