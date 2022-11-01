import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easmaterialdidaticoadm/infra/model/group_model.dart';

import '../../domain/repositories/group_repository.dart';

class GroupRepositoryImpl implements GroupRepository {

  final FirebaseFirestore firestore;

  GroupRepositoryImpl(this.firestore);

  @override
  Stream<QuerySnapshot> getAllGroup() {

    CollectionReference data = firestore.collection('turmas');
    return data.orderBy("nome",descending: false).snapshots();
  }

  @override
  Future<DocumentSnapshot<Object?>> getGroupById({required String id})async {
    CollectionReference data = firestore.collection('turmas');
    return await data.doc(id).get();
  }

  @override
  Future<void> updateModuleById({required String turmaId,required String moduleName,required String moduleId}) async{
    CollectionReference data = firestore.collection('turmas');
print(turmaId);
print(moduleName);
print(moduleId);

    await data.doc(turmaId).set({"modulos": FieldValue.arrayUnion([{
      "dataFim": "2022 00:00:00",
      "dataInicio": "2022 00:00:00",
      "disponivel": true,
      "moduloId": moduleId,
      "nomeModulo": moduleName
    }
    ])}, SetOptions(merge: true));
  }

}
