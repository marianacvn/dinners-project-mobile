import 'package:flutter/material.dart';
import 'package:flutter_application_1/connection/pedido.dart';
import 'package:flutter_application_1/models/mesaModel.dart';
import 'package:flutter_application_1/models/pedidoModel.dart';

import 'connection/produto.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  Produto produtoService = Produto();
  Pedido pedidoService = Pedido();

  late List<int> listaProdutos = [];
  int tamanhoAnterior = 0;

  verficaQuantProduto(int prod) {
    int count = 0;
    for (int i in listaProdutos) {
      if (i == prod) {
        count++;
      }
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    final pedidoModelTemp = ModalRoute.of(context)!.settings.arguments as PedidoModel;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cardápio'),
        backgroundColor: Colors.red[900],
      ),
      body: Container(
        child: FutureBuilder<List>(
          future: produtoService.listarPrdouto(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, i) {
                    return cardWidget(
                        snapshot.data![i]['id'],
                        snapshot.data![i]['nomeproduto'],
                        snapshot.data![i]['descricaoproduto'],
                        snapshot.data![i]['preco'],
                        snapshot.data![i]['linkimagem']);
                  });
            } else {
              return const Center(
                child: Text('Não foi encontrado o produto'),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 290),
              child: TextButton(
                onPressed: () {
                  pedidoService.enviarPedido(
                      pedidoModelTemp.mesa, pedidoModelTemp.cliente, listaProdutos);
                  Navigator.pushNamed(context, '/comanda',
                      arguments:
                          PedidoModel(pedidoModelTemp.mesa, 1, listaProdutos));
                },
                child: const Text(
                  'Finalizar Pedido',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardWidget(int id, String titulo, String descricao, double valor,
      String linkImagem) {
    return Center(
      child: Card(
        color: Colors.white,
        child: SizedBox(
          width: 400,
          height: 200,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(linkImagem)),
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          titulo,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20, left: 20, top: 10, bottom: 10),
                        child: Text(
                          descricao,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          "R\$ ${valor}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 40,
                              width: 50,
                              child: FittedBox(
                                child: FloatingActionButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0.0),
                                    side: const BorderSide(color: Colors.red),
                                  ),
                                  onPressed: () {
                                    listaProdutos.remove(id);
                                    setState(() {
                                      tamanhoAnterior = listaProdutos.length;
                                    });
                                  },
                                  backgroundColor: Colors.redAccent,
                                  child: const Icon(
                                    Icons.horizontal_rule,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                                '${tamanhoAnterior != listaProdutos.length ? 0 : verficaQuantProduto(id)}'),
                            SizedBox(
                              height: 40,
                              width: 50,
                              child: FittedBox(
                                child: FloatingActionButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0.0),
                                    side: const BorderSide(color: Colors.red),
                                  ),
                                  onPressed: () {
                                    listaProdutos.add(id);
                                    setState(() {
                                      tamanhoAnterior = listaProdutos.length;
                                    });
                                  },
                                  backgroundColor: Colors.redAccent,
                                  child: const Icon(
                                    Icons.add,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
