import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitness/models/atleta.dart';

import '../models/posicao.dart';

class FirestoreService {
  final CollectionReference atletas =
      FirebaseFirestore.instance.collection('atletas');
  final CollectionReference posicoes =
      FirebaseFirestore.instance.collection('posicoes');

  //  CREATE

  Future<void> createAtleta(Atleta atleta) async {
    try {
      await atletas.add({
        'id': atleta.id,
        'nome': atleta.nome,
        'email': atleta.email,
        'telefone': atleta.telefone,
        'cpf': atleta.cpf,
        'endereco': atleta.endereco,
        'avatar': atleta.avatar,
        "posicaoId": atleta.posicaoId,
      });
    } catch (e) {
      print(e);
    }
  }

  // READ

  Future<List<Atleta>> getAtletas() async {
    var buscarAtletas = await atletas.orderBy('nome').get();
    List<Atleta> result = [];
    for (var element in buscarAtletas.docs) {
      var atleta = Atleta.fromDocumentSnapshot(element);
      result.add(atleta);
    }
    return result;
  }

  Stream<QuerySnapshot> getClientSteam(String query) {
    final atletasSteam = atletas.orderBy('nome').snapshots();

    return atletasSteam;
  }

  Stream<QuerySnapshot> getClientPosicaoSteam(String query) {
    final atletasSteam = posicoes.orderBy('nome').snapshots();

    return atletasSteam;
  }

  // UPDATE

  Future<void> updateAtleta(Atleta atleta) {
    return atletas.doc(atleta.id).update({
      'nome': atleta.nome,
      'email': atleta.email,
      'telefone': atleta.telefone,
      'cpf': atleta.cpf,
      'endereco': atleta.endereco,
      'avatar': atleta.avatar,
      "posicaoId": atleta.posicaoId,
    });
  }

  // DELETE

  Future<void> deleteAtleta(String id) {
    return atletas.doc(id).delete();
  }

  Future<String?> uploadImage(File imageFile) async {
    try {
      String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceRoot.child('images');

      Reference referenceImageToUpload =
          referenceDirImages.child(uniqueFileName);

      await referenceImageToUpload.putFile(imageFile);
      return await referenceImageToUpload.getDownloadURL();
    } catch (e) {
      print('Erro ao fazer upload da imagem: $e');
      return null;
    }
  }

  // Métodos CRUD para Posicao
  // CREATE
  Future<void> createPosicao(Posicao posicao) async {
    try {
      await posicoes.add(posicao.toJson());
    } catch (e) {
      print(e);
    }
  }

  // READ
  Future<List<Posicao>> getPosicoes() async {
    var buscarPosicoes = await posicoes.orderBy('nome').get();
    List<Posicao> result = [];
    for (var element in buscarPosicoes.docs) {
      var posicao = Posicao.fromDocumentSnapshot(element);
      result.add(posicao);
    }
    return result;
  }

  Stream<QuerySnapshot> getPosicoesStream() {
    return posicoes.orderBy('nome').snapshots();
  }

  // UPDATE
  Future<void> updatePosicao(Posicao posicao) {
    return posicoes.doc(posicao.id).update(posicao.toJson());
  }

  // DELETE
  Future<void> deletePosicao(String id) {
    return posicoes.doc(id).delete();
  }
}
