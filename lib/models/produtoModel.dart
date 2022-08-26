import 'dart:ffi';

class ProdutoModel {
  int idProduto;
  String nomeproduto;
  String descricaoproduto;
  double preco;
  double quantidade;

  ProdutoModel(this.idProduto, this.nomeproduto, this.descricaoproduto,
      this.preco, this.quantidade);
}
