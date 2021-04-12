import 'dart:js';

import 'package:flutter/material.dart';

import 'package:pizzaria_app/widgets/appBar.dart';
import 'package:pizzaria_app/widgets/bottomBar.dart';

class HistoricoPage extends StatelessWidget {
  List<Map<String, dynamic>> pedidos = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        child: Center(
          child: Text("EM CONSTRUÇÃO"),
        ),
      ),
      bottomNavigationBar: bottomBar(context),
    );
  }
}

additens(pedidos) {
  Map<String, dynamic> pedido = {
    'numero': 1,
    'data': "20200317",
    'nome': "arepa"
  };

  pedidos.add(pedido);
  pedido = {'numero': 1, 'data': "20200317", 'nome': "arepa"};
  pedidos.add(pedido);
  pedido = {'numero': 1, 'data': "20200317", 'nome': "arepa"};
  pedidos.add(pedido);
  pedido = {'numero': 1, 'data': "20200317", 'nome': "arepa"};
  pedidos.add(pedido);
  pedido = {'numero': 1, 'data': "20200317", 'nome': "arepa"};
  pedidos.add(pedido);
  return pedidos;
}

body(pedidos, context) {
  return ListView(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            "Histórico de Pedidos",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
      ),
      SizedBox(
        height: 30,
      ),
      additens(pedidos),
      ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return null;
        },
      ),
    ],
  );
}

// card(){
//   return 
// }