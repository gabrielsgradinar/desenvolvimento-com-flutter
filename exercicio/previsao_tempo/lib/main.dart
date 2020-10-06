import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:previsao_tempo/components/componentes.dart';

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
  TextEditingController cidadeController = TextEditingController();
  GlobalKey<FormState> cForm = GlobalKey<FormState>();
  String temperatura = "Temperatura:";
  String data = "Data:";
  String hora = "Hora:";
  String descricao = "Descrição:";
  String cidade = "Cidade:";
  String velocidadeDoVento = "Velocidade do Vento:";

  Function validaCidade = ((value) {
    if (value.isEmpty) {
      return "Cidade vazia";
    }
    return null;
  });

  consultaPrevisaoDoTempo() async {
    if (!cForm.currentState.validate()) return null;

    String url =
        "https://api.hgbrasil.com/weather?key=82174d0d&city_name=${cidadeController.text}";
    var encodedUrl = Uri.encodeFull(url);
    Response resposta = await get(encodedUrl);
    Map body = jsonDecode(resposta.body);

    setState(() {
      temperatura =
          'Temperatura: ' + body['results']['temp'].toString() + ' °C';
      data = 'Data: ' + body['results']['date'].toString();
      hora = 'Hora: ' + body['results']['time'].toString();
      descricao = 'Descrição: ' + body['results']['description'].toString();
      cidade = 'Cidade: ' + body['results']['city_name'].toString();
      velocidadeDoVento =
          'Velocidade do Vento: ' + body['results']['wind_speedy'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Previsão do Tempo'),
      ),
      body: Form(
        key: cForm,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 500,
                height: 100,
                child: Image.asset('assets/imgs/nuvem.jpg', fit: BoxFit.cover),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Componentes.caixaDeTexto(
                  "Cidade",
                  "Digite a cidade",
                  cidadeController,
                  validaCidade,
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 100,
                child: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.search,
                    color: Colors.blue,
                  ),
                  onPressed: () => consultaPrevisaoDoTempo(),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Componentes.rotulo(cidade),
                    Componentes.rotulo(data),
                    Componentes.rotulo(hora),
                    Componentes.rotulo(temperatura),
                    Componentes.rotulo(descricao),
                    Componentes.rotulo(velocidadeDoVento),
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
