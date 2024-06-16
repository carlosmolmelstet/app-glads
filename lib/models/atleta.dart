import 'package:cloud_firestore/cloud_firestore.dart';

class Atleta {
  String? id;
  String nome;
  String? avatar;
  String cpf;
  String telefone;
  String email;
  String endereco;
  String? posicaoId;

  Atleta({
    required this.id,
    required this.nome,
    required this.avatar,
    required this.cpf,
    required this.telefone,
    required this.email,
    required this.endereco,
    required this.posicaoId,
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
      'posicaoId': posicaoId,
    };
  }

  factory Atleta.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return Atleta(
      id: snapshot.id,
      nome: snapshot['nome'],
      avatar: snapshot['avatar'],
      cpf: snapshot['cpf'],
      telefone: snapshot['telefone'],
      email: snapshot['email'],
      endereco: snapshot['endereco'],
      posicaoId: snapshot['posicaoId'],
    );
  }
}
