import 'package:cloud_firestore/cloud_firestore.dart';

class Posicao {
  String? id;
  String nome;

  Posicao({
    required this.id,
    required this.nome,
  });

  toJson() {
    return {
      'id': id,
      'nome': nome,
    };
  }

  factory Posicao.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return Posicao(
      id: snapshot.id,
      nome: snapshot['nome'],
    );
  }
}
