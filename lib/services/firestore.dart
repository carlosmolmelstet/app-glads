import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitness/models/atleta.dart';

class FirestoreService {
  // get collection atletas

  final CollectionReference atletas =
      FirebaseFirestore.instance.collection('atletas');

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

  // UPDATE

  Future<void> updateAtleta(Atleta atleta) {
    return atletas.doc(atleta.id).update({
      'nome': atleta.nome,
      'email': atleta.email,
      'telefone': atleta.telefone,
      'cpf': atleta.cpf,
      'endereco': atleta.endereco,
      'avatar': atleta.avatar,
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
}
