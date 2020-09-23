void main() {
  // print('Olá Mundo !!');
  // TIPOS NUMÉRICOS
  // INT, DOUBLE, NUM
  var idade = 22;
  double salario = 1250.50;
  num tamanho = 1.8;

  // print('Idade $idade, salário $salario, tamanho $tamanho');

  var soma = idade + salario + tamanho;

  print(soma);

  //String
  String nome = 'Gabriel';
  String sobrenome = 'Gradinar';

  print(nome.toLowerCase());
  print(sobrenome.toUpperCase());

  String nomeCompleto = nome + ' ' + sobrenome;
  print(nomeCompleto);

  //comparação de string
  String texto1 = 'texto1';
  String texto2 = 'texto1';

  if (texto1 == texto2)
    print('Iguais');
  else
    print('Diferentes');

  //boleano
  bool verdadeiro = true;
  bool falso = false;

  if (verdadeiro || falso)
    print('true');
  else
    print('false');

  //dynamic
  dynamic peso = 100;
  print(peso);

  peso = "100 quilos";
  print(peso);
}
