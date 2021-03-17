import 'package:flutter/material.dart';
import 'package:pizzaria_app/widgets/appBar.dart';
import 'package:pizzaria_app/widgets/bottomBar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: bottomBar(context),
      body: body(),
    );
  }
}

body() {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Icon(
                MdiIcons.accountCircle,
                size: 70,
              ),
              Container(
                padding: EdgeInsets.only(left: 32),
                child: Text(
                  "Nome do User",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Open Sans",
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.black,
          height: 20,
        ),
        item(icon: MdiIcons.cog, title: "Meus Dados"),
        Divider(
          color: Colors.black,
          height: 20,
        ),
        item(icon: MdiIcons.creditCard, title: "Meus Cartões"),
        Divider(
          color: Colors.black,
          height: 20,
        ),
        item(icon: MdiIcons.mapMarker, title: "Meus Endereços"),
        Divider(
          color: Colors.black,
          height: 20,
        ),
        item(icon: MdiIcons.bell, title: "Notificações"),
        Divider(
          color: Colors.black,
          height: 20,
        ),
        item(icon: MdiIcons.textBoxCheckOutline, title: "Pedidos"),
        Divider(
          color: Colors.black,
          height: 20,
        ),
        item(icon: MdiIcons.shareVariant, title: "Convidar amigos"),
        Divider(
          color: Colors.black,
          height: 20,
        ),
      ],
    ),
  );
}

item({icon, title}) {
  return Row(
    children: [
      Icon(
        icon,
        size: 50,
      ),
      Container(
        padding: EdgeInsets.only(left: 32),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontFamily: "Open Sans",
          ),
        ),
      ),
    ],
  );
}
