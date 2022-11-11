import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easmaterialdidaticoadm/presenter/ui/controller/group_controller.dart';
import 'package:get/get.dart';

import '../../../domain/repositories/group_repository.dart';
import '../../../domain/repositories/module_repository.dart';
import '../../../domain/usercases/group_services.dart';
import '../../../domain/usercases/module_service.dart';
import '../../../infra/repositories/group_repository_impl.dart';
import '../../../infra/repositories/module_repository_impl.dart';
import '../../../infra/services/group_service_impl.dart';
import '../../../infra/services/module_service_impl.dart';

class GroupBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupController>(() {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      GroupRepository repository = GroupRepositoryImpl(firestore);
      GroupService groupService = GroupServiceImpl(repository);
      ModuleRepository moduleRepository = ModuleRepositoryImpl(firestore);
      ModuleService moduleService = ModuleServiceImpl(moduleRepository);
      return GroupController(groupService: groupService, moduleService: moduleService,);
    });
  }

}