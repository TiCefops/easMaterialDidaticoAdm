import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styles/app_text_stayle.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({Key? key, required this.data}) : super(key: key);
  final QueryDocumentSnapshot data;
  @override
  Widget build(BuildContext context) {

    String turma="";



    return Center(
      child: SizedBox(
        width: Get.width * 0.5,
        child: Card(
          child: Column(
            children: [
              Text(
                "Nome: ${data.get("nome")}",
                style: AppTextStyle.titleHome,
              ),
              Text(
                "E-mail: ${data.get("email")}",
                style: AppTextStyle.titleHome,
              ),
              Text(
                "Cpf: ${data.get("cpf")}",
                style: AppTextStyle.titleHome,
              ),
              Text(
                "uid: ${data.get("uid")}",
                style: AppTextStyle.titleHome,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Editar",
                      style: AppTextStyle.titleButton,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Suspender"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );

  }
  // Future<String> setCurso(DocumentSnapshot data)async{
  //   final GetGroupServiceImpl services=GetGroupServiceImpl();
  //   String turma="";
  //   try{
  //
  //     turma=await data.get("turma");
  //
  //     DocumentSnapshot serv= await services.getGroup(turma);
  //     turma=serv.get("nome");
  //
  //   }catch(e){
  //     turma="N/D";
  //
  //   }
  //
  //   return turma;
  // }

}


