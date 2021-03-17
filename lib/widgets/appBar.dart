import 'package:flutter/material.dart';

appBar() {
  return (AppBar(
    flexibleSpace: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 20,
          ),
          child: Center(child: Image.asset("assets/img/logo.png")),
          width: 80,
        ),
      ],
    ),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(68),
      child: SizedBox(
        height: 10,
      ),
    ),
  ));
}
