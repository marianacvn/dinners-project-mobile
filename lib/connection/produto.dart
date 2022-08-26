import 'dart:convert';

import 'package:flutter_application_1/models/produtoModel.dart';
import 'package:http/http.dart' as http;

class Produto {
  String baseUrl = "http://10.0.2.2:8000/api/produto/";

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

  Future<List<ProdutoModel>> getProdutos() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        List<ProdutoModel> produtos = [];

        List listaProdutos = jsonDecode(response.body);
        for (var prod in listaProdutos) {
          ProdutoModel produto = ProdutoModel(0, '', '', 0.0, 0.0);
          produto = ProdutoModel(prod['id'], prod['nomeproduto'], prod['descricaoproduto'],
              prod['preco'], prod['quantidade']);
          produtos.add(produto);
        }
        return produtos;
      } else {
        throw Exception('Produtos náo encontrado!');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
