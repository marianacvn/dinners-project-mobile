import 'package:flutter/material.dart';
import 'package:flutter_application_1/connection/cliente.dart';

class Cadastropage extends StatefulWidget {
  const Cadastropage({Key? key}) : super(key: key);

  @override
  State<Cadastropage> createState() => _CadastropageState();
}

class _CadastropageState extends State<Cadastropage> {
  String nome = '';
  String email = '';
  String senha = '';
  String confSenha = '';

  Cliente clienteService = Cliente();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Cadastrar"),
          backgroundColor: Colors.red[900],
        ),
        body: SingleChildScrollView(
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(

                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'resources/images/logodiner.png',
                          width: 200,
                        ),
                        TextField(
                          onChanged: (text) {
                            nome = text;
                          },
                          decoration: InputDecoration(
                              labelText: 'Nome', border: OutlineInputBorder()),
                        ),
                        SizedBox(height: 10),
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
                        SizedBox(height: 10),
                        TextField(
                          onChanged: (text) {
                            confSenha = text;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: 'Confirmação de senha',
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(height: 15),
                        ElevatedButton(
                            onPressed: () {
                              clienteService.enviarCliente(
                                  nome, email, senha, confSenha);
                              Navigator.of(context).pushNamed('/login');
                            },
                            child: const Text('Cadastrar'),
                            style: ElevatedButton.styleFrom(
                              primary:
                                  Colors.redAccent, //background color of button
                              side:
                                  BorderSide(width: 3, color: Colors.redAccent),
                              elevation: 3, //elevation of button
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              padding: EdgeInsets.all(20),
                            )),
                      ]))),
        ));
  }
}
