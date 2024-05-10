import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference states =
      FirebaseFirestore.instance.collection('states');

  Future<void> adicionarViagemAoFirestore(String estacao, String partida,
      String rota, String valor, bool disponivel) async {
    try {
      await FirebaseFirestore.instance.collection('viagens').add({
        'estacao': estacao,
        'partida': partida,
        'rota': rota,
        'valor': valor,
        'disponivel': disponivel,
      });
      print('Viagem adicionada com sucesso ao Firestore!');
    } catch (e) {
      print('Erro ao adicionar viagem ao Firestore: $e');
    }
  }
}
