import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

bottomBar(context) {
  return Container(
    margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xffDE0D18),
        elevation: 100,
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).pushNamed("/cardapio");
          }
          if (index == 1) {
            Navigator.of(context).pushNamed("/pedido");
          }
          if (index == 2) {
            Navigator.of(context).pushNamed("/perfil");
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
              size: 35,
              color: Colors.black,
            ),
            label: 'Comprar',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.article_outlined,
              size: 35,
              color: Colors.black,
            ),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.accountCircle,
              size: 35,
              color: Colors.black,
            ),
            label: 'Perfil',
          ),
        ],
      ),
    ),
  );
}
