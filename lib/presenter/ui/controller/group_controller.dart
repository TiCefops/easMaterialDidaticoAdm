
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easmaterialdidaticoadm/domain/repositories/group_repository.dart';
import 'package:easmaterialdidaticoadm/domain/repositories/module_repository.dart';
import 'package:easmaterialdidaticoadm/domain/usercases/group_services.dart';
import 'package:easmaterialdidaticoadm/domain/usercases/module_service.dart';
import 'package:easmaterialdidaticoadm/infra/repositories/group_repository_impl.dart';
import 'package:easmaterialdidaticoadm/infra/services/group_service_impl.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../infra/repositories/module_repository_impl.dart';
import '../../../infra/services/module_service_impl.dart';

class GroupController extends GetxController{
late final FirebaseFirestore _firestore;
late final GroupRepository _repository;
late final GroupService _service;
late final ModuleService _moduleService;
late final ModuleRepository _moduleRepository;

@override
  void onInit() async{
  _firestore=FirebaseFirestore.instance;
  _repository=GroupRepositoryImpl(_firestore);
  _service=GroupServiceImpl(_repository);
  _moduleRepository=ModuleRepositoryImpl(_firestore);
  _moduleService=ModuleServiceImpl(_moduleRepository);
 super.onInit();
  }

  RxBool loading=false.obs;

  final StreamController streamController=StreamController();
Map<String,dynamic> selectedValue={};

Future<List<Map<String,dynamic>>> getAllModulesByCourseId({required String courseId})async{
  List<Map<String,dynamic>> data=[];
  QuerySnapshot snap=await _moduleService.getAllModules(courseId: courseId);
  for (var element in snap.docs) {
    Map<String,dynamic> currentData=element.data() as Map<String,dynamic>;
    data.add(currentData);
  }
  return data;
}

void selectValuesForMenu (Map<String,dynamic> selectedValues){
  selectedValue=   selectedValues;
  update();
}

  Future<void> setModule({required String turmaId})async{
    loading.value=true;
  await _service.setModule(turmaId,selectedValue["id"],selectedValue["nome"]);
    loading.value=false;

  }

  Stream<QuerySnapshot> getAllGroup() async*{
   yield* _service.getAllGroup();
  }

@override
  void onClose() {
    streamController.close();
super.onClose();
  }
}