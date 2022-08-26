import 'dart:convert';

import 'package:flutter_application_1/models/clienteModel.dart';
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

  Future<ClienteModel> getCliente(String email, String senha) async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        ClienteModel cliente = ClienteModel(0);

        List listaUsuarios = jsonDecode(response.body);
        for (var user in listaUsuarios) {
          if (user['email'] == email && user['senha'] == senha) {
            cliente = ClienteModel(user['id']);
          }
        }
        return cliente;
      } else {
        throw Exception('Cliente náo encontrado!');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  
  Future<ClienteModel> getClientePorId(int id) async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        ClienteModel cliente = ClienteModel(0);

        List listaUsuarios = jsonDecode(response.body);
        for (var user in listaUsuarios) {
          if (user['id'] == id) {
            cliente = ClienteModel(user['id']);
          }
        }
        return cliente;
      } else {
        throw Exception('Cliente náo encontrado!');
      }
    } catch (e) {
      throw Exception(e);
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
