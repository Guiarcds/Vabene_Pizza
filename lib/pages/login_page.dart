import 'package:flutter/material.dart';
import 'package:pizzaria_app/pages/cardapio_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDE0D18),
      body: body(context, _formKey, _passKey),
    );
  }
}

body(context, _formKey, _passKey) {
  return Padding(
    padding: const EdgeInsets.only(top: 130),
    child: Center(
      child: ListView(
        children: [
          Image.asset(
            "assets/img/logologin.png",
            width: 140,
            height: 140,
          ),
          Container(
            child: Column(
              children: [
                Container(
                  width: 390,
                  padding: EdgeInsets.only(top: 30, bottom: 30),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty || value == null) {
                          return 'Preencha o campo Email!';
                        }
                        if (value != 'admin') {
                          return 'Email Incorreto!';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        //decoration
                        filled: true,
                        fillColor: Color(0xffF5F5F5),
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Email',
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
                  width: 390,
                  padding: EdgeInsets.only(bottom: 25),
                  child: Form(
                    key: _passKey,
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty || value == null) {
                          return 'Preencha o campo Senha!';
                        }
                        if (value != 'admin') {
                          return 'Senha Incorreta!';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffF5F5F5),
                        prefixIcon: Icon(Icons.lock),
                        hintText: 'Senha',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20, bottom: 40),
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Esqueceu Sua Senha?',
                          style: TextStyle(
                            color: Color(0xffE1E1E1),
                            fontSize: 13,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                width: 160,
                height: 65,
                child: Padding(
                  padding: EdgeInsets.only(),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffDE0D18),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Color(0xffF5F5F5),
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        if (_passKey.currentState.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      CardapioPage()));
                        }
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Color(0xffE1E1E1),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Ainda Não Possuo Conta!',
                    style: TextStyle(
                      color: Color(0xffE1E1E1),
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
