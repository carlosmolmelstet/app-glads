import '../models/atleta.dart';

class AtletasRepository {
  List<Atleta> atletasMock = [
    Atleta(
      id: 1,
      nome: 'Carlos Eduardo  ',
      avatar: 'https://avatars.githubusercontent.com/u/64798175?v=4',
      cpf: '123.456.789-00',
      telefone: '(11) 99999-9999',
      email: 'carlos@gmail.com',
      endereco: 'Rua das Flores, 123',
    ),
    Atleta(
      id: 2,
      nome: 'Carlos Testecar',
      avatar:
          'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png',
      cpf: '123.456.789-00',
      telefone: '(11) 99999-9999',
      email: 'asdasd',
      endereco: 'Rua das Flores, 123',
    ),
    Atleta(
      id: 3,
      nome: 'João',
      avatar:
          'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png',
      cpf: '123.456.789-00',
      telefone: '(11) 99999-9999',
      email: 'asdasd',
      endereco: 'Rua das Flores, 123',
    ),
    Atleta(
      id: 4,
      nome: 'Maria',
      avatar:
          'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png',
      cpf: '123.456.789-00',
      telefone: '(11) 99999-9999',
      email: 'asdasd',
      endereco: 'Rua das Flores, 123',
    ),
    Atleta(
      id: 5,
      nome: 'José',
      avatar:
          'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png',
      cpf: '123.456.789-00',
      telefone: '(11) 99999-9999',
      email: 'asdasd',
      endereco: 'Rua das Flores, 123',
    ),
  ];

  List<Atleta> getAtletas() {
    return atletasMock;
  }

  Atleta getAtleta(String nome) {
    List<Atleta> atletas = getAtletas();
    return atletas.firstWhere((element) => element.nome == nome);
  }

  void addAtleta(Atleta atleta) {
    List<Atleta> atletas = getAtletas();
    atletas.add(atleta);
  }

  void removeAtleta(String nome) {
    List<Atleta> atletas = getAtletas();
    atletas.removeWhere((element) => element.nome == nome);
  }

  void updateAtleta(Atleta atleta) {
    int index = atletasMock.indexWhere((element) => element.id == atleta.id);
    atletasMock[index] = atleta;
  }
}
