import 'package:flutter/material.dart';

class Componentes {
  static botaoIcone(Function _f, dynamic tipoIcone,
      {String texto, double tamanho, Image imagem}) {
    return IconButton(
      icon: imagem != null ? imagem : Icon(tipoIcone),
      tooltip: texto,
      onPressed: _f,
      iconSize: tamanho != null ? tamanho : 30,
    );
  }

  static caixaDeNumero(String rotulo, String dica,
      TextEditingController controlador, validacao) {
    return TextFormField(
      controller:
          controlador, // armazena as informações inseridas no componente
      obscureText: false, // mascara de senha
      keyboardType: TextInputType.number,
      validator: validacao,
      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: TextStyle(fontSize: 18),
        hintText: dica, // placeholder
        hintStyle: TextStyle(fontSize: 10, color: Colors.red),
      ),
    );
  }
}
