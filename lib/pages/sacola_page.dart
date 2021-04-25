import 'package:flutter/material.dart';
import 'package:pizzaria_app/widgets/appBar.dart';
import 'package:pizzaria_app/widgets/bottomBar.dart';
import '../api/cepApi.dart';
import '../domain/endereco.dart';

class SacolaPage extends StatefulWidget {
  @override
  _SacolaPageState createState() => _SacolaPageState();
}

class _SacolaPageState extends State<SacolaPage> {
  final cepKey = GlobalKey<FormState>();
  String rua = "";
  String bairro = "";
  String cidade = "";
  var controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: appBar(),
      body: body(context),
      bottomNavigationBar: bottomBar(context),
    );
  }

  useUrl(String value) async {
    CepApi cep = new CepApi();
    CepValidate local = await cep.useUrl(value);
    setState(() {
      rua = local.logradouro;
      bairro = local.bairro;
      cidade = local.localidade;
    });
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
                  padding: const EdgeInsets.only(
                      top: 10, right: 30, left: 30, bottom: 20),
                  child: Column(
                    children: [
                      Container(
                        width: 350,
                        child: Form(
                          child: TextFormField(
                            controller: controller,
                            key: cepKey,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              //decoration
                              filled: true,
                              fillColor: Color(0xffF5F5F5),
                              prefixIcon: Icon(Icons.map_outlined),
                              hintText: 'CEP',
                              hintStyle: TextStyle(
                                color: Color(0xff8C8B8B),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 60,
                        child: Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 2),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xffDE0D18),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Color(0xffF5F5F5),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              useUrl(controller.text);
                            },
                            child: Text('Inserir CEP'),
                          ),
                        ),
                      ),
                      Container(
                        width: 500,
                        height: 60,
                        child: Padding(
                          padding: EdgeInsets.only(top: 3),
                          child: Expanded(
                            child: Column(
                              children: [
                                Text('Logradouro: $rua'),
                                Text('Bairro: $bairro'),
                                Text('Cidade: $cidade'),
                              ],
                            ),
                          ),
                        ),
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
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("CUPOM DE DESCONTO"),
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
}
