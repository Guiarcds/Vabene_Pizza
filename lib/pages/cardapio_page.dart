import 'package:flutter/material.dart';
import 'package:pizzaria_app/BD/produtos_dao.dart';
import 'package:pizzaria_app/widgets/bottombar.dart';
import 'package:pizzaria_app/widgets/floatingActionButton.dart';
import '../domain/produto.dart';

class CardapioPage extends StatefulWidget {
  @override
  _CardapioPageState createState() => _CardapioPageState();
}

class _CardapioPageState extends State<CardapioPage> {
  Future<List<Produto>> listaProdutos;
  @override
  void initState() {
    super.initState();
    listaProdutos = ProdutosDao().obterProdutos();
    print(listaProdutos.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingButton(context),
      appBar: searchAppBar(),
      body: body(listaProdutos),
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

body(Future<List<Produto>> listaProdutos) {
  return Padding(
      padding: EdgeInsets.all(16),
      child: FutureBuilder<List<Produto>>(
        future: listaProdutos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildListView(snapshot.data);
          }

          return Center(child: CircularProgressIndicator());
        },
      ));
}

buildListView(List<Produto> produtos) {
  return ListView.builder(
      itemCount: produtos.length,
      itemBuilder: (BuildContext context, int index) {
        return card(
            img: produtos[index].img,
            nome: produtos[index].nome,
            preco: produtos[index].preco,
            descricao: produtos[index].descricao,
            context: context);
      });
}

card({img, nome, preco, descricao, context}) {
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
                      nome,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "R\$ " + preco.toString(),
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
