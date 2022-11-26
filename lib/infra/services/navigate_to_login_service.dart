
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../presenter/ui/pages/not_authorized_page.dart';
import '../../presenter/ui/routes/routes.dart';

class NavigateToLoginService{

  Future<void> navigateToLogin(String routes)async {
    final FirebaseAuth auth=FirebaseAuth.instance;
    if(auth.currentUser?.uid==null){
      Future.delayed(Duration.zero,(){Get.toNamed(Routes.login);});
    }else{
      await _getUserInfo(auth.currentUser!.uid,routes);
    }

  }
  Future<void> _getUserInfo(String uuid,String routes)async{
    FirebaseFirestore firestore= FirebaseFirestore.instance;
      DocumentSnapshot data= await firestore.collection("admins").doc(uuid).get().onError((error, stackTrace) {

      if(error.toString().contains("permission-denied")){
        Get.to(() =>  const NotAuthorizedPage());
      }
       throw Exception("Falha ao Buscar dados Do Usuário: $error");
      });

      if(data.exists){
        if(data.get("ativo")!=true) {
          Get.to(() => const NotAuthorizedPage());

        }else {
          (Get.toNamed(routes));
        }
      }
else{
        Get.to(() => const NotAuthorizedPage());

      }

  }
}