import 'package:flutter/material.dart';
import 'package:pizzaria_app/widgets/bottombar.dart';

class CardapioPage extends StatefulWidget {
  @override
  _CardapioPageState createState() => _CardapioPageState();
}

class _CardapioPageState extends State<CardapioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchAppBar(),
      body: body(context),
      bottomNavigationBar: bottomBar(context),
    );
  }
}

searchAppBar() {
  return (AppBar(
    title: Image.asset(
      "assets/img/logo.png",
      height: 45,
    ),
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(68),
      child: Container(
        padding: EdgeInsets.only(bottom: 20),
        width: 300,
        height: 60,
        child: TextField(
          textAlignVertical: TextAlignVertical.bottom,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xffF5F5F5),
            hintText: "Buscar",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    ),
  ));
}

body(context) {
  return ListView(
    children: [
      card(
          img: "assets/img/arepa.jpg",
          title: "Arepa",
          preco: "2.00",
          descricao: "Tem um moi de coisa",
          context: context),
      Container(
        margin: EdgeInsets.only(right: 30, top: 432),
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          backgroundColor: Color(0xffDE0D18),
          onPressed: () {
            Navigator.of(context).pushNamed("/sacola");
          },
          child: Image.asset(
            "assets/img/shopping-bag.png",
            width: 40,
          ),
        ),
      ),
    ],
  );
}

card({img, title, preco, descricao, context}) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pushNamed("/pedido");
    },
    child: Card(
      child: Row(
        children: [
          Image.asset(
            img,
            height: 80,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 8,
                  right: 8,
                ),
                width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "R\$ " + preco,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(descricao),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
