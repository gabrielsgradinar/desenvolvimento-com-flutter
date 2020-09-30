import 'dart:convert';

import 'package:aula_03/components/componentes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController cepController = TextEditingController();
  GlobalKey<FormState> cForm = GlobalKey<FormState>();
  String rua = "Rua:";
  String complemento = "Complemento:";
  String bairro = "Bairro:";
  String cidade = "Cidade:";
  String uf = "UF:";

  Function validaCep = ((value) {
    if (value.isEmpty) {
      return "CEP inválido";
    }
    return null;
  });

  clicouNoBotao() async {
    if (!cForm.currentState.validate()) return null;

    String url = "https://viacep.com.br/ws/${cepController.text}/json/";
    Response resposta = await get(url);
    Map body = jsonDecode(resposta.body);
    setState(() {
      rua = rua + ' ' + body['logradouro'];
      complemento = complemento + ' ' + body['complemento'];
      bairro = bairro + ' ' + body['bairro'];
      cidade = cidade + ' ' + body['localidade'];
      uf = uf + ' ' + body['uf'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('ViaCEP'),
      // ),
      body: Form(
        key: cForm,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                child: Image.asset(
                  'assets/imgs/via-cep.png',
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Componentes.caixaDeTexto(
                    "CEP", "Digite o CEP", cepController, validaCep,
                    numero: true),
              ),
              Container(
                alignment: Alignment.center,
                height: 100,
                child: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.globe,
                    color: Colors.green,
                  ),
                  onPressed: () => clicouNoBotao(),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Componentes.rotulo(rua),
                    Componentes.rotulo(complemento),
                    Componentes.rotulo(bairro),
                    Componentes.rotulo(cidade),
                    Componentes.rotulo(uf),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
