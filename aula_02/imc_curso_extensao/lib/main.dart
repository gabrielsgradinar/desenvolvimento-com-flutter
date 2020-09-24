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
        title: Text("Calcula IMC"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: resetaCampos,
          )
        ],
      ),
      body: criaFormularioIMC(),
    );
  }

  criaFormularioIMC() {
    return Form(
      key: cForm,
      child: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 40, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, //alinhamento no inicio
          children: [
            Componentes.caixaDeTexto(
                "Peso", "Digite o peso", txtPeso, validaPeso,
                numero: true),
            Componentes.caixaDeTexto(
                "Altura", "Digite a altura", txtAltura, validaAltura,
                numero: true),
            Componentes.botao("Calcular", calcularImc),
            Text(
              info,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }

  Function validaPeso = ((value) {
    if (value.isEmpty) {
      return "Informe o Peso";
    }
    if (int.parse(value) <= 0) {
      return "O peso não deve ser zero ou negativo";
    }
    return null;
  });

  Function validaAltura = ((value) {
    if (value.isEmpty) {
      return "Informe o Altura";
    }
    if (double.parse(value) <= 0) {
      return "A altura não deve ser zero ou negativo";
    }
    return null;
  });

  resetaCampos() {
    txtAltura.text = "";
    txtPeso.text = "";
    setState(() {
      info = "Informe os deus dados";
      cForm = GlobalKey<FormState>();
    });
  }

  calcularImc() {
    setState(() {
      // atualiza o estado da página
      if (!cForm.currentState.validate()) {
        return null;
      }
      double a = double.parse(txtAltura.text);
      double p = double.parse(txtPeso.text);
      double imc = p / (a * a);

      if (imc < 18.5)
        info = "Abaixo do peso (${imc.toStringAsPrecision(4)})";
      else if (imc >= 18.5 && imc < 30)
        info = "Peso ideal (${imc.toStringAsPrecision(4)})";
      else
        info = "Acima do peso (${imc.toStringAsPrecision(4)})";
    });
  }
}
