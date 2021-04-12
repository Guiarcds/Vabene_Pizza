import 'package:flutter/material.dart';

FloatingActionButton floatingButton(context) {
  return FloatingActionButton(
    backgroundColor: Color(0xffDE0D18),
    onPressed: () {
      Navigator.of(context).pushNamed("/sacola");
    },
    child: Image.asset(
      "assets/img/shopping-bag.png",
      width: 40,
    ),
  );
}
