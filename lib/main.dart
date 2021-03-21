import 'package:flutter/material.dart';
import 'package:pizzaria_app/pages/login_page.dart';
import 'package:pizzaria_app/pages/pedido_page.dart';
import 'package:pizzaria_app/pages/perfil_page.dart';
import 'pages/cardapio_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xffDE0D18),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes: {
        "/cardapio": (context) => CardapioPage(),
        "/pedido": (context) => PedidoPage(),
        "/perfil": (context) => PerfilPage(),
        "/login": (context) => LoginPage(),
      },
    );
  }
}
