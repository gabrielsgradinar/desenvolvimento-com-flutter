void main() {
  // LISTAS
  var letras = List();
  letras.add('a');
  letras.add('b');
  letras.add('c');
  letras.add('d');
  letras.add('e');

  var numeros = [1, 2, 3, 4, 5];

  for (int i = 0; i < letras.length; i++) {
    print(letras[i]);
  }

  numeros.forEach((n) => print(n));

  // MAP
  var chaveValor = Map();
  chaveValor[1] = 'posição 1';
  chaveValor['A'] = 'letra A';
  chaveValor[true] = 'true';

  chaveValor.forEach((chave, valor) => print('$chave - $valor'));

  // não é obrigatório utilizar a palavra (new)
  // ex: Calculadora c = new Calculadora();
  Calculadora c = Calculadora();
  print(c.somar(1, 2));

  print(Calculadora.multiplicar(2, 3));

  Aluno a = Aluno('Gabriel');
  print("Nome do aluno ${a.nome}");
}

// CLASSES

class Calculadora {
  somar(int a, int b) {
    return a + b;
  }

  static multiplicar(num a, num b) {
    return a * b;
  }
}

class Aluno {
  String nome;

  //construtor
  Aluno(this.nome);
}
