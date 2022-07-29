import 'package:flutter/material.dart';

class ComandaPage extends StatefulWidget {
  const ComandaPage({Key? key}) : super(key: key);

  @override
  State<ComandaPage> createState() => _ComandaPageState();
}

class _ComandaPageState extends State<ComandaPage> {
  Widget _itemComanda(BuildContext context, int index) {
    return SizedBox(
      width: 300,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              'Itens do Pedido,',
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
            children: const [
              Text(
                'Mesa:',
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
              itemBuilder: _itemComanda,
              itemCount: 5,
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
                onPressed: () {},
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
