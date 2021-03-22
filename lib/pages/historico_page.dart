import 'package:flutter/material.dart';

import 'package:pizzaria_app/widgets/appBar.dart';
import 'package:pizzaria_app/widgets/bottomBar.dart';

class HistoricoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(context),
      bottomNavigationBar: bottomBar(context),
    );
  }
}

additens() {
  Map<String, dynamic> pedido = {
    'numero': 1,
    'data': "20200317",
    'nome': "arepa"
  };
  List<Map<String, dynamic>> pedidos = [];
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

body(context) {
  return ListView(
    children: [
      Center(
        child: Text(
          "Histórico de Pedidos",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      SizedBox(
        height: 30,
      ),
      Text("Data do Pedido"),
      Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("# Número do Pedido"),
            Divider(
              color: Colors.black,
            ),
          ],
        ),
      ),
    ],
  );
}

// conteudo(context) {
//   List pedidos = additens();

//   return ListView.builder(
//     itemBuilder: (context, index) {
//       for (var i = 0; i < pedidos.length; i++) {
//         for (var k = 0; k < pedidos.length; k++) {
//           if (pedidos[i]["numero"] == k) {
//             return Text(
//               pedidos[index]['nome'],
//               style: TextStyle(
//                 fontSize: 30,
//               ),
//             );
//           }
//         }
//       }
//       return Divider(
//         color: Colors.black,
//         height: 20,
//         thickness: 2,
//       );
//     },
//     itemCount: pedidos.length,
//   );
// }
