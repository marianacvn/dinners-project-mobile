import 'package:flutter/material.dart';
import 'package:flutter_application_1/cadastro_page.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/models/clienteModel.dart';

import 'connection/cliente.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  Cliente clienteService = Cliente();
  String email = '';
  String senha = '';

  bool logado = false;
  ClienteModel clienteModel = ClienteModel(0);

  _realizarLogin(BuildContext context, String login, String senha) async {
    logado = await clienteService.listarCliente(login, senha);
  }

  _pegarCliente(BuildContext context, String login, String senha) async {
    clienteModel = await clienteService.getCliente(login, senha);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'resources/images/logodiner.png',
                ),
                TextField(
                  onChanged: (text) {
                    email = text;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Email', border: OutlineInputBorder()),
                ),
                SizedBox(height: 10),
                TextField(
                  onChanged: (text) {
                    senha = text;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Senha', border: OutlineInputBorder()),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                    onPressed: () {
                      _realizarLogin(context, email, senha);
                      _pegarCliente(context, email, senha);
                      if (logado == true) {
                        Navigator.pushNamed(context, '/',
                            arguments: clienteModel);
                        logado = false;
                      }
                    },
                    child: const Text('Entrar'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent, //background color of button
                      side: BorderSide(width: 3, color: Colors.redAccent),
                      elevation: 3, //elevation of button
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.all(20),
                    )),
                SizedBox(height: 15),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/cadastrar');
                    },
                    child: Text(
                      "Não está cadastrado? Cadastre-se",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ))
              ],
            )),
      ),
    ));
  }
}
