import 'package:flutter/material.dart';
import 'package:flutter_application_1/cadastro_page.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:flutter_application_1/menu_page.dart';

import 'comanda_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Floating Action Bubble Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: Directionality(textDirection: TextDirection.rtl, child: HomePage()),
      initialRoute: '/login',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => Loginpage(),
        '/cadastrar': (context) => Cadastropage(),
        '/cardapio': (context) => MenuPage(),
        '/comanda': (context) => ComandaPage()
      },
    );
  }
}
