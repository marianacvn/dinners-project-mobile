import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cardápio'),
        backgroundColor: Colors.red[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            cardWidget(
                'Prato Fit Tradicional',
                'Esta opção fit é nosso prato da casa.',
                15.00,
                'https://i.pinimg.com/originals/fd/07/a3/fd07a30ea47c2e57bbb84e1a89eaac28.jpg'),
            cardWidget(
                'Avocoado Toast',
                'Este é o café da manhã preferido dos clientes da casa.',
                9.95,
                'https://i.pinimg.com/originals/6c/6e/a6/6c6ea6c7088f82e90e8eb9979b776139.jpg'),
            cardWidget(
                'Avocoado Strawberry',
                'Lanche com Frutas e Folhas.',
                13.99,
                'https://i.pinimg.com/originals/3a/73/b6/3a73b64702d663afaf6d71daff0bcecb.jpg'),
            cardWidget(
                'Hambúrguer da Casa',
                'Este Hambúrguer é um dos lanches mais pedidos da casa.',
                14.99,
                'http://hamburguerdesucesso.com.br/wp-content/uploads/2018/12/prato-para-hamburguer.jpeg'),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 290),
              child: TextButton(
                onPressed: () => Navigator.of(context).pushNamed('/comanda'),
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

  Widget cardWidget(
      String titulo, String descricao, double valor, String linkImagem) {
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
                                  onPressed: () {},
                                  backgroundColor: Colors.redAccent,
                                  child: const Icon(
                                    Icons.horizontal_rule,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                            const Text('1'),
                            SizedBox(
                              height: 40,
                              width: 50,
                              child: FittedBox(
                                child: FloatingActionButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0.0),
                                    side: const BorderSide(color: Colors.red),
                                  ),
                                  onPressed: () {},
                                  backgroundColor: Colors.redAccent,
                                  child: const Icon(
                                    Icons.add,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: 50,
                              child: FittedBox(
                                child: FloatingActionButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0.0),
                                      side:
                                          const BorderSide(color: Colors.red)),
                                  onPressed: null,
                                  backgroundColor: Colors.redAccent,
                                  child: const Text(
                                    'Add',
                                    style: TextStyle(fontSize: 16),
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