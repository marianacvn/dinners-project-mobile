import 'package:flutter/material.dart';
import 'package:flutter_application_1/connection/pedido.dart';
import 'package:flutter_application_1/models/pedidoModel.dart';

class ComandaPage extends StatefulWidget {
  const ComandaPage({Key? key}) : super(key: key);

  @override
  State<ComandaPage> createState() => _ComandaPageState();
}

class _ComandaPageState extends State<ComandaPage> {
  Pedido pedidoService = Pedido();

  Widget _itemComanda(BuildContext context, int index, PedidoModel pedido) {
    return SizedBox(
      width: 300,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              'Item ${pedido.produto[index]}',
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
              'Quantidade,',
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final pedidoModel =
        ModalRoute.of(context)!.settings.arguments as PedidoModel;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          ' Detalhamento de Comanda',
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
            children: const [
              Text(
                'Pedido:  ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat-Bold',
                ),
              ),
            ],
          ),
          Flexible(
            child: ListView.builder(
              itemBuilder: (context, i) {
                return _itemComanda(context, i, pedidoModel);
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
                                  onPressed: () =>
                                      Navigator.of(context).pushNamed('/')),
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
