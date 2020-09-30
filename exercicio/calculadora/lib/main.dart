import 'package:calculadora/utils/componentes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController txtNumero1 = TextEditingController();
  TextEditingController txtNumero2 = TextEditingController();
  GlobalKey<FormState> cForm = GlobalKey<FormState>();
  String info = "Resultado";

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
        backgroundColor: Colors.black,
        title: Text("Calculadora"),
        centerTitle: true,
        actions: <Widget>[Componentes.botaoIcone(resetaCampos, Icons.refresh)],
      ),
      body: criaCorpoCalculadora(),
    );
  }

  criaCorpoCalculadora() {
    return Form(
      key: cForm,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Componentes.caixaDeNumero("Número 1",
                      "Digite o primeiro numero", txtNumero1, validaNumero),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Componentes.caixaDeNumero("Número 2",
                      "Digite o segundo numero", txtNumero2, validaNumero),
                ),
              ],
            ),
            Text(
              "Escolha a operação",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                  child: Componentes.botaoIcone(soma, Icons.add,
                      texto: "Somar"), // somar,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                  child: Componentes.botaoIcone(subtracao, Icons.remove,
                      texto: "Subtrair"), // subitração
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                  child: Componentes.botaoIcone(multiplicacao, Icons.clear,
                      texto: "Multiplicar"), // multiplicação
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                  child: Componentes.botaoIcone(divisao, Icons.build,
                      texto: "Dividir",
                      imagem: Image.asset('images/divisao_icon.png'),
                      tamanho: 28), // divisão
                ),
              ],
            ),
            Text(
              info,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Function validaNumero = ((value) {
    if (value.isEmpty) {
      return "Informe o número";
    }
    return null;
  });

  soma() {
    return operacao("+");
  }

  subtracao() {
    return operacao("-");
  }

  multiplicacao() {
    return operacao("*");
  }

  divisao() {
    return operacao("/");
  }

  operacao(op) {
    setState(() {
      // atualiza o estado da página
      if (!cForm.currentState.validate()) {
        return null;
      }
      double n1 = double.parse(txtNumero1.text);
      double n2 = double.parse(txtNumero2.text);
      info = "Resultado =";

      if (op == "+") {
        info = "Resultado da soma = ${n1 + n2}";
      }

      if (op == "-") {
        info = "Resultado da subtração = ${n1 - n2}";
      }

      if (op == "*") {
        info = "Resultado da multiplicação = ${n1 * n2}";
      }

      if (op == "/") {
        info = "Resultado da divisão = ${(n1 / n2).toStringAsPrecision(2)}";
      }
    });
  }

  resetaCampos() {
    txtNumero1.text = "";
    txtNumero2.text = "";
    setState(() {
      info = "Resultado";
      cForm = GlobalKey<FormState>();
    });
  }
}
