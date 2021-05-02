import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pizzaria_app/pages/perfil_page.dart';

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
            Navigator.of(context).pushNamed("/historico");
          }
          if (index == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => PerfilPage()));
          }
        },
        items: const <BottomNavigationBarItem>[
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
