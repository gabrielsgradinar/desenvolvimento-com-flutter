void main() {
  mensagemErro();
  print(soma(2, 3));

  exibirCursoEProfessor('Flutter');
  exibirCursoEProfessor('IOT', 'João');

  exibirAlunosEMedia("Gabriel", media: 10);

  bool logado = true;
  if (logado)
    navega(paginaInicial);
  else
    navega(paginaLogin);

  mostrarMensagem('Olá Mundo !!');
}

mensagemErro() {
  print('Erro fatal');
}

int soma(int a, int b) {
  return a + b;
}

// parametro opcional [tipo nome]
// valor padrão [tipo nome = valor]
exibirCursoEProfessor(String curso, [String professor = 'Desconhecido']) {
  print('Curso: $curso - Professor: $professor');
}

// obriga a passar o nome do paramatro ao chamar a função {tipo nome}
exibirAlunosEMedia(String nome, {double media}) {
  if (media != null) {
    if (media >= 7) {
      print("$nome está aprovado(a)");
    } else {
      print("$nome está reprovado(a)");
    }
  } else {
    print('A nota não foi postada');
  }
}

//função como variavel
Function paginaInicial = () {
  return "ações necessárias para navegar para a página inicial";
};

Function paginaLogin = () {
  return "ações necessárias para navegar para a página login";
};

navega(Function f) {
  print(f());
}

//arrow function
mostrarMensagem(String msg) => print('A mensagem é: *** $msg ***');
