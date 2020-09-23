import 'package:flutter/material.dart';
import 'utils/componentes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtPeso = TextEditingController();
  TextEditingController txtAltura = TextEditingController();
  GlobalKey<FormState> cForm = GlobalKey<FormState>();
  String info = "Informe os deus dados";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: telaPrincipal(),
    );
  }

  telaPrincipal() {
    return Scaffold(
      appBar: AppBar(
        title: Text("IMC Flutter"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: Form(
        key: cForm,
        child: Container(
          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, //alinhamento no inicio
            children: [
              Componentes.caixaDeTexto("Nome", "Digite o nome", txtNome, null),
              Componentes.caixaDeTexto("Peso", "Digite o peso", txtPeso, null,
                  numero: true),
              Componentes.caixaDeTexto(
                  "Altura", "Digite a altura", txtAltura, null,
                  numero: true),
              Componentes.botao("Calcular", null),
              Text(
                info,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
