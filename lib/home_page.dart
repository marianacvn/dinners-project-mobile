import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/clienteModel.dart';
import 'package:flutter_application_1/models/mesaModel.dart';
import 'package:flutter_application_1/models/pedidoModel.dart';

import 'connection/mesa.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;
  // Mesa mesaService = Mesa();

  Future<List> mesas = Mesa().listarMesa();

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  Widget _cardTable(BuildContext context, MesaModel mesaModel) {

    final clienteModel = ModalRoute.of(context)!.settings.arguments as ClienteModel;

    return GestureDetector(
      onTap: () {
        if (mesaModel.statusMesa == false) {
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
                      const Text('Esta mesa já está reservada!'),
                      const SizedBox(
                        height: 13,
                      ),
                      ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.redAccent),
                        child: const Text('Voltar'),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        } else {
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
                      const Text('Deseja realmente reservar esta mesa?'),
                      const SizedBox(
                        height: 13,
                      ),
                      ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.redAccent),
                        child: const Text('Sim'),
                        onPressed: () => Navigator.pushNamed(
                            context, '/cardapio',
                            arguments: PedidoModel(
                                mesaModel.idMesa, clienteModel.idCliente, [])),
                      ),
                      ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.redAccent),
                        child: const Text('Não'),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
      child: Card(
        color: Colors.white,
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.table_bar,
                    color: mesaModel.statusMesa == true
                        ? Colors.green
                        : Colors.red,
                    size: 50),
                Text(
                  '${mesaModel.idMesa}',
                  style: TextStyle(
                      color: mesaModel.statusMesa == true
                          ? Colors.green
                          : Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Reserva de Mesas"),
        backgroundColor: Colors.red[900],
      ),
      body: Container(
        child: FutureBuilder<List>(
          future: mesas,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  // itemBuilder: _cardTable,
                  itemBuilder: (context, i) {
                    return _cardTable(
                        context,
                        MesaModel(snapshot.data![i]['id'],
                            snapshot.data![i]['statusmesa']));
                  },
                  itemCount: snapshot.data?.length);
            } else {
              return const Center(
                child: Text('Não foi encontrado'),
              );
            }
          },
        ),
      ),
    );
  }
}
