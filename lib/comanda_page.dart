import 'package:flutter/material.dart';
import 'package:flutter_application_1/connection/cliente.dart';
import 'package:flutter_application_1/connection/pedido.dart';
import 'package:flutter_application_1/connection/produto.dart';
import 'package:flutter_application_1/models/clienteModel.dart';
import 'package:flutter_application_1/models/pedidoModel.dart';
import 'package:flutter_application_1/models/produtoModel.dart';

class ComandaPage extends StatefulWidget {
  const ComandaPage({Key? key}) : super(key: key);

  @override
  State<ComandaPage> createState() => _ComandaPageState();
}

class _ComandaPageState extends State<ComandaPage> {
  Pedido pedidoService = Pedido();
  Produto produtoService = Produto();
  Cliente clienteService = Cliente();

  List<ProdutoModel> produtos = [];

  ClienteModel clienteModel = ClienteModel(0);

  _pegarCliente(BuildContext context, int id) async {
    clienteModel = await clienteService.getClientePorId(id);
  }

  _listarProdutos() async {
    for (ProdutoModel p in await produtoService.getProdutos()) {
      produtos.add(p);
    }
  }

  Widget _itemComanda(BuildContext context, int index, ProdutoModel prod) {
    return SizedBox(
      width: 300,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              prod.nomeproduto,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat-Light',
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              'R\$ ${prod.preco}',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat-Light',
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pedidoModel =
        ModalRoute.of(context)!.settings.arguments as PedidoModel;

    _listarProdutos();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Detalhamento de Comanda',
        ),
        backgroundColor: Colors.red[900],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text(
                'Mesa: ${pedidoModel.mesa}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat-Bold',
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Item',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat-Light',
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Valor',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat-Light',
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
          Flexible(
            child: ListView.builder(
              itemBuilder: (context, i) {
                ProdutoModel prod = ProdutoModel(0, '', '', 0.0, 0.0);
                for (ProdutoModel p in produtos) {
                  if (p.idProduto == pedidoModel.produto[i]) {
                    prod = p;
                  }
                }
                print(prod.descricaoproduto);
                return _itemComanda(context, i, prod);
              },
              itemCount: pedidoModel.produto.length,
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 299),
              child: TextButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        color: Colors.white,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text(
                                  'Deseja realmente finalizar e chamar o garçom?'),
                              const SizedBox(
                                height: 13,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.redAccent),
                                child: const Text('Sim'),
                                onPressed: () {
                                  _pegarCliente(context, pedidoModel.cliente);
                                  Navigator.pushNamed(
                                    context,
                                    '/',
                                    arguments: clienteModel,
                                  );
                                },
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.redAccent),
                                child: const Text('Não'),
                                onPressed: () => Navigator.pop(context),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Text(
                  'Finalizar',
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat-Bold',
                      fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
