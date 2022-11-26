import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:get/get.dart';

import '../../../domain/usercases/group_services.dart';
import '../../../domain/usercases/module_service.dart';

class GroupController extends GetxController {
  final GroupService groupService;
  final ModuleService moduleService;

  GroupController({
    required this.groupService,
    required this.moduleService,
  });

  RxBool loading = false.obs;

  final StreamController streamController = StreamController();
  Map<String, dynamic> selectedValue = {};

  Future<List<Map<String, dynamic>>> getAllModulesByCourseId(
      {required String courseId}) async {
    return await moduleService.getAllModules(courseId: courseId);
  }

  void selectValuesForMenu(Map<String, dynamic> selectedValues) {
    selectedValue = selectedValues;
    update();
  }

  Future<void> setModule({required String turmaId}) async {
    loading.value = true;
    await groupService.setModule(
        turmaId, selectedValue["id"], selectedValue["nome"]);
    loading.value = false;
  }

  Stream<QuerySnapshot> getAllGroup() async* {
    yield* groupService.getAllGroup();
  }
  Future<void> showGroupToSingIn({required String groupId,required bool currentValue})async{

    await groupService.showGroupToSingIn(groupId: groupId, currentValue: currentValue);
  }
  Future<void> removeModuleById({required String turmaId,required Map<String,dynamic> module})async{
    await groupService.removeModuleById(turmaId: turmaId, module: module);

  }


  @override
  void onClose() {
    streamController.close();
    super.onClose();
  }
}
