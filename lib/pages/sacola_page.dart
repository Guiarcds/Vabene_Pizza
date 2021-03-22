import 'package:flutter/material.dart';
import 'package:pizzaria_app/widgets/appBar.dart';
import 'package:pizzaria_app/widgets/bottomBar.dart';

class SacolaPage extends StatefulWidget {
  @override
  _SacolaPageState createState() => _SacolaPageState();
}

class _SacolaPageState extends State<SacolaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: appBar(),
      body: body(context),
      bottomNavigationBar: bottomBar(context),
    );
  }
}

body(context) {
  return ListView(
    children: [
      Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Meu carrinho",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Icon(
              Icons.shopping_cart,
              size: 30,
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "REFRIGERANTE GUARANÁ- 2L",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Refrigerante guaraná antartica",
                  style: TextStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.add_circle,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      child: Text(
                        "1",
                      ),
                    ),
                    Icon(
                      Icons.remove_circle,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 250),
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Text("R\$6,00"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "PIZZA DE CALABRESA - tamanho G",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Calabresa, cebola e mussarela",
                  style: TextStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.add_circle,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      child: Text(
                        "1",
                      ),
                    ),
                    Icon(
                      Icons.remove_circle,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 242),
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Text("R\$30,00"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on_sharp,
                  ),
                  Text(
                    "ENDEREÇO DE ENTREGA:",
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Na casa do Tarsis"),
                    Text(
                      "alterar",
                      style: TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("CUPON DE DESCONTO"),
                  Text("NACONTADOTARSIS"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("FORMA DE PAGAMENTO"),
                  Text("DINHEIRO"),
                ],
              ),
            ],
          ),
        ),
      ),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text("RESUMO DA SACOLA"),
                ],
              ),
              Divider(
                thickness: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("1 PIZZA DE CALABRESA -G"),
                  Text("R\$30,00"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("1 REFRIGERANTE GUARANÁ"),
                  Text("R\$6,00"),
                ],
              ),
              Divider(
                thickness: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TOTAL",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("R\$36,00"),
                ],
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        margin: EdgeInsets.only(
          bottom: 30,
        ),
        height: 50,
        width: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            alignment: Alignment.center,
            primary: Color(0xffDE0D18),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed("/historico");
          },
          child: Text("Finalizar Pedido"),
        ),
      ),
    ],
  );
}
