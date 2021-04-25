import 'package:flutter/material.dart';
import 'pages/cardapio_page.dart';
import 'pages/historico_page.dart';
import 'pages/login_page.dart';
import 'pages/pedido_page.dart';
import 'pages/perfil_page.dart';
import 'pages/sacola_page.dart';

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
      initialRoute: "/sacola",
      routes: {
        "/cardapio": (context) => CardapioPage(),
        "/pedido": (context) => PedidoPage(),
        "/perfil": (context) => PerfilPage(),
        "/login": (context) => LoginPage(),
        "/historico": (context) => HistoricoPage(),
        "/sacola": (context) => SacolaPage(),
      },
    );
  }
}
