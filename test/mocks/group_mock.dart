
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:mockito/mockito.dart';

class GroupMock {

  FakeFirebaseFirestore appInfoMock() {
    final instance = FakeFirebaseFirestore();

    return instance;
  }

  FakeFirebaseFirestore setGroup(){
    final instance = FakeFirebaseFirestore();
    instance.collection("turmas").add(
        {
          "mostrar": false,
          "nome": "217",
          "id": "6AzSrZtlIUbkIMfWkOLv",
          "modulos": [{
            "moduloId": "1zmJvcLymGdBB3wb7Vtd",
            "disponivel": true,
            "nomeModulo": "MóduloI",
            "dataFim": "Timestamp(seconds=1651028400, nanoseconds=0)",
            "dataInicio": "Timestamp(seconds=1651028400, nanoseconds=0)"
          },
            {
              "dataFim": "Timestamp(seconds=1653361200, nanoseconds=0)",
              "moduloId": "2AwRVIzXvx2BSMFsoT0l",
              "nomeModulo": "Módulo II",
              "dataInicio": "Timestamp(seconds=1653361200, nanoseconds=0)",
              "disponivel": true
            }
          ],
          "courseId": "xBzfxiqVvIiDvKpEvKja",
          "periodo": "manhã"
        }
    );instance.collection("turmas").doc("6AzSrZtlIUbkIMfWkOLv").set(
        {
          "mostrar": false,
          "nome": "219",
          "id": "6AzSrZtlIUbkIMfWkOLv",
          "modulos": [{
            "moduloId": "1zmJvcLymGdBB3wb7Vtd",
            "disponivel": true,
            "nomeModulo": "MóduloI",
            "dataFim": "Timestamp(seconds=1651028400, nanoseconds=0)",
            "dataInicio": "Timestamp(seconds=1651028400, nanoseconds=0)"
          },
            {
              "dataFim": "Timestamp(seconds=1653361200, nanoseconds=0)",
              "moduloId": "2AwRVIzXvx2BSMFsoT0l",
              "nomeModulo": "Módulo II",
              "dataInicio": "Timestamp(seconds=1653361200, nanoseconds=0)",
              "disponivel": true
            }
          ],
          "courseId": "xBzfxiqVvIiDvKpEvKja",
          "periodo": "tarde"
        }
    );
    return instance;
  }
}