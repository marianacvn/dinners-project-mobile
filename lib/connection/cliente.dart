import 'dart:convert';

import 'package:http/http.dart' as http;

class Cliente {
  String baseUrl = "http://10.0.2.2:8000/api/cliente/";

  Future<bool> listarCliente(String email, String senha) async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        bool confirmar = false;

        List listaUsuarios = jsonDecode(response.body);
        for (var user in listaUsuarios) {
          print(user['email']);
          print(email);
          if (user['email'] == email && user['senha'] == senha) {
            confirmar = true;
          }
        }
        return confirmar;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<List> enviarCliente(String nomeCliente, String email, String senha,
      String confirmacaoSenha) async {
    final http.Response response = await http.post(Uri.parse(baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'nomecliente': nomeCliente,
          'email': email,
          'senha': senha,
        }));
    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Não foi possível carregar os clientes');
    }
  }
}
