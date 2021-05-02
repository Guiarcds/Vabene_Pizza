import 'package:flutter/material.dart';
import 'package:pizzaria_app/pages/sacola_page.dart';

FloatingActionButton floatingButton(context) {
  return FloatingActionButton(
    backgroundColor: Color(0xffDE0D18),
    onPressed: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => SacolaPage()));
    },
    child: Icon(Icons.shopping_cart_rounded),
  );
}
