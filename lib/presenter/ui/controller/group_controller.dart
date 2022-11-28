import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easmaterialdidaticoadm/domain/entities/course_entity.dart';

import 'package:get/get.dart';

import '../../../domain/usercases/course/get_all_course_usecase.dart';
import '../../../domain/usercases/group/group_services.dart';
import '../../../domain/usercases/module_service.dart';
import '../widgets/module_edit_widget.dart';

class GroupController extends GetxController {
  final GroupService groupService;
  final ModuleService moduleService;
  final GetAllCourseUseCase getAllCourseUseCase;

  GroupController({
    required this.groupService,
    required this.moduleService,
    required this.getAllCourseUseCase,
  });

  @override
  void onInit() async {
    super.onInit();
    await getAllCourseUseCase.call();
  }

  RxBool loading = false.obs;
  RxString selectedCourseName = "".obs;
  RxString selectedCourseId = "".obs;
  RxList shiftItems = ["Matutino", "Vespertino", "Noturno"].obs;
  RxString selectedShift = "Matutino".obs;

  CourseEntity dropDownValue = CourseEntity();

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

  ///Busca As Turmas
  Stream<QuerySnapshot> getAllGroup() async* {
    yield* groupService.getAllGroup();
  }

  ///Ativa e destaiva mostrar a turma na tela inicial
  Future<void> showGroupToSingIn(
      {required String groupId, required bool currentValue}) async {
    await groupService.showGroupToSingIn(
        groupId: groupId, currentValue: currentValue);
  }

  Future<void> removeModuleById(
      {required String turmaId, required Map<String, dynamic> module}) async {
    await groupService.removeModuleById(turmaId: turmaId, module: module);
  }

  Future<List<CourseEntity>> getAllCourse() async {
    return await getAllCourseUseCase.call();
  }

  CourseEntity setDropDownValue(CourseEntity value) {
    dropDownValue = value;
    update();
    return value;
  }

  Future<void> newGroup({required String nome}) async {
    var data = await getAllModulesByCourseId(courseId: selectedCourseId.value);
    Map<String, dynamic> moduloMatriz = {};

    for (var element in data) {
      String nome = element["nome"];
      if (nome.contains("Matriz Curricular")) {
        moduloMatriz.addAll(element);
      }
    }
    Map<String, dynamic> moduloMatrizFormatado = {
      "dataInicio": DateTime.now().toString(),
      "dataFim": DateTime.now().toString(),
      "disponivel": true,
      "moduloId": moduloMatriz["id"],
      "nomeModulo": moduloMatriz["nome"],
    };
    Map<String, dynamic> groupData = {
      "courseId": selectedCourseId.value,
      "nomeCurso": selectedCourseName.value,
      "mostrar": false,
      "nome": nome,
      "periodo": selectedShift.value,
      "modulos": [moduloMatrizFormatado]
    };
    await groupService.createNewGroup(groupData: groupData).then((value) {
      Get.back();
      Get.defaultDialog(
          title:groupData["nome"] ,
          content: ModuleEdit(
            group: groupData,
          ));
    });
  }

  @override
  void onClose() {
    streamController.close();
    super.onClose();
  }
}
