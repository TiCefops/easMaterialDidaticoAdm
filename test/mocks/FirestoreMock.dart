import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

class FirestoreMock {
  FakeFirebaseFirestore appInfoMock() {
    final instance = FakeFirebaseFirestore();

    return instance;
  }

  FakeFirebaseFirestore setCourseData() {
    final instance = FakeFirebaseFirestore();
    instance.collection('cursos').doc("JKvhYXcuDsUhKrgbvYP7").set({
      'ativo': true,
      'receberCadastro': true,
      'firstModule': '40MS5oEwxYLQDBUtVZwj',
      'id': 'JKvhYXcuDsUhKrgbvYP7',
      'nome': 'Auxiliar de Enfermagem'
    });

    instance.collection('cursos').add({
      'ativo': true,
      'receberCadastro': true,
      'firstModule': '1zmJvcLymGdBB3wb7Vtd',
      'id': 'xBzfxiqVvIiDvKpEvKja',
      'nome': 'Técnico de Enfermagem'
    });
    return instance;
  }

  FakeFirebaseFirestore setModules() {
    final instance = FakeFirebaseFirestore();
    instance.collection('modulos').add({
      'id': 'JKvhYXcuDsUhKrgbvYP7',
      'nome': 'Auxiliar de Enfermagem',
      'modulos': {}
    });
    instance.collection('cursos').add({
      'ativo': true,
      'firstModule': '1zmJvcLymGdBB3wb7Vtd',
      'id': 'xBzfxiqVvIiDvKpEvKja',
      'nome': 'Técnico de Enfermagem'
    });
    return instance;
  }

  FakeFirebaseFirestore setUserData() {
    final instance = FakeFirebaseFirestore();
    instance.collection('users').doc("teste1").set({
      'cpf': "0000000000",
      'cursos': [{'ativo': true, 'courseId': '000000000000000'}],
      'email': 'teste1@cefops.com',
      'modulos': [{'ativo': true, 'modulo': '000000000000000'}],
      'nome': 'Teste 1',
      'uid': 'teste1'
    });
    instance.collection('users').doc("teste2").set({
      'cpf': "0000000001",
      'cursos':[ {'ativo': false, 'courseId': '000000000000000'}],
      'email': 'teste2@cefops.com',
      'modulos': [{'ativo': true, 'modulo': '00000000000002'}],
      'nome': 'Teste 2',
      'uid': 'teste2'
    });
    return instance;
  }
}
