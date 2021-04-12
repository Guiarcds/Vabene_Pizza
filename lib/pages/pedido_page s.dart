import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzaria_app/widgets/appBar.dart';
import 'package:pizzaria_app/widgets/bottomBar.dart';
import 'package:pizzaria_app/widgets/floatingActionButton.dart';

class PedidoPage extends StatefulWidget {
  @override
  _PedidoPageState createState() => _PedidoPageState();
}

class _PedidoPageState extends State<PedidoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingButton(context),
      appBar: appBar(),
      bottomNavigationBar: bottomBar(context),
      body: body(context),
    );
  }
}

body(context) {
  return ListView(
    children: [
      SizedBox(
        height: 20,
      ),
      Center(
        child: Text(
          "CONFIRMAR PRODUTO",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 50, left: 35),
        child: Text(
          "NOME DO PRODUTO",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.only(left: 60, top: 30),
        child: Text(
          "Descrição.",
          style: TextStyle(
            fontSize: 15,
            color: Color(0xffDE0D18),
          ),
        ),
      ),
      SizedBox(
        height: 60,
      ),
      Column(
        children: [
          Container(
            height: 50,
            width: 160,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Colors.red)),
              ),
              child: Text(
                "Inserir Observação",
                style: TextStyle(
                  color: Color(0xffDE0D18),
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      SizedBox(
        height: 50,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.remove_circle_outline,
              size: 30,
            ),
          ),
          Text(
            "R\$ 11,00",
            style: TextStyle(
              color: Colors.green,
              fontSize: 20,
            ),
          ),
          IconButton(
            color: Color(0xffDE0D18),
            onPressed: () {},
            icon: Icon(
              Icons.add_circle,
              size: 30,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 120,
      ),
    ],
  );
}
