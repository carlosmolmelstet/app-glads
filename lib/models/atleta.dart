import 'package:cloud_firestore/cloud_firestore.dart';

class Atleta {
  String? id;
  String nome;
  String? avatar;
  String cpf;
  String telefone;
  String email;
  String endereco;

  Atleta({
    required this.id,
    required this.nome,
    required this.avatar,
    required this.cpf,
    required this.telefone,
    required this.email,
    required this.endereco,
  });

  toJson() {
    return {
      'id': id,
      'nome': nome,
      'avatar': avatar,
      'cpf': cpf,
      'telefone': telefone,
      'email': email,
      'endereco': endereco,
    };
  }

  factory Atleta.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    // Aqui você pode acessar os campos do documento e criar uma instância de Atleta
    return Atleta(
      id: snapshot.id,
      nome: snapshot['nome'],
      avatar: snapshot['avatar'],
      cpf: snapshot['cpf'],
      telefone: snapshot['telefone'],
      email: snapshot['email'],
      endereco: snapshot['endereco'],
    );
  }
}
