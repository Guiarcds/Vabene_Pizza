import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
      bottomNavigationBar: bottomBar(),
    );
  }
}

appBar() {
  return (AppBar(
    backgroundColor: Colors.red,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Gratinatti",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        Icon(
          Icons.local_pizza_outlined,
        ),
      ],
    ),
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
            fillColor: Colors.white,
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

bottomBar() {
  return Container(
    margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.red,
        elevation: 100,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
              size: 30,
            ),
            label: 'Comprar',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.article_outlined,
              size: 30,
            ),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_pin,
              size: 32,
            ),
            label: 'Perfil',
          ),
        ],
      ),
    ),
  );
}

body() {
  return ListView(
    children: [
      card(
          img: "assets/img/arepa.jpg",
          title: "Arepa",
          preco: "2.00",
          descricao: "Tem um moi de coisa"),
    ],
  );
}

card({img, title, preco, descricao}) {
  return Card(
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
  );
}
