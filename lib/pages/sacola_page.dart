import 'package:flutter/material.dart';
import 'package:pizzaria_app/pages/cardapio_page.dart';
import 'package:pizzaria_app/pages/map_page.dart';
import 'package:pizzaria_app/widgets/appBar.dart';
import 'package:geocoding/geocoding.dart';
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
      appBar: appBar(context),
      body: body(context),
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

  Future<void> mapOnPressed() async {
    List<Location> locations = await locationFromAddress(rua);

    double lat = locations[0].latitude;
    double long = locations[0].longitude;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                MapPage(latitude: lat, longitude: long)));
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
                  padding: const EdgeInsets.only(
                      top: 8, left: 1, bottom: 8, right: 3),
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
                      "AREPA - TAMANHO P",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Um moi de coisa",
                    style: TextStyle(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8, left: 1, bottom: 8, right: 3),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_circle,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          "6",
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
            padding:
                const EdgeInsets.only(bottom: 10, top: 1, left: 1, right: 1),
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
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Center(
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
                                  child: Text('  Inserir  '),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
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
                                  onPressed: mapOnPressed,
                                  child: Text('Distância'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text('Rua: $rua'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text('Bairro: $bairro'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text('Cidade: $cidade'),
                            ),
                          ),
                        ],
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
                    Text("6 AREPAs"),
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
            bottom: 20,
          ),
          height: 50,
          width: 200,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              alignment: Alignment.center,
              primary: Color(0xffDE0D18),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => CardapioPage()));
            },
            child: Text("Finalizar Pedido"),
          ),
        ),
      ],
    );
  }
}
