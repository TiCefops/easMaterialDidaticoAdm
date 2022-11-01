import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easmaterialdidaticoadm/domain/repositories/group_repository.dart';
import 'package:easmaterialdidaticoadm/infra/repositories/group_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/group_mock.dart';

void main() async {
  final GroupMock _mock = GroupMock();
  final GroupRepository _repository = GroupRepositoryImpl(_mock.setGroup());

  group("Teste do repositorio Group", () {
    test("Teste buscar todos cursos", () async {
      final Stream<QuerySnapshot> data = _repository.getAllGroup();
      data.listen((event) {
        expect(2, event.docs.length);
      });
    });

    test("Deve Retornar o Curso '6AzSrZtlIUbkIMfWkOLv' ", () async {
      final DocumentSnapshot data =
          await _repository.getGroupById(id: "6AzSrZtlIUbkIMfWkOLv");
      expect(true, data.exists);
      expect("6AzSrZtlIUbkIMfWkOLv", data.id);
    });
    test("Deve Retornar Error  ", () async {
      final DocumentSnapshot data =
          await _repository.getGroupById(id: "6AzSrZtlIUbkIMfWkOLvf");

      expect(false, data.exists);
    });
  });
}
