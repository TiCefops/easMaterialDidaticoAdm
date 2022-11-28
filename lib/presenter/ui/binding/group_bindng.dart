import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easmaterialdidaticoadm/presenter/ui/controller/group_controller.dart';
import 'package:get/get.dart';

import '../../../domain/repositories/course_repository.dart';
import '../../../domain/repositories/group_repository.dart';
import '../../../domain/repositories/module_repository.dart';
import '../../../domain/usercases/course/get_all_course_usecase.dart';
import '../../../domain/usercases/course/get_all_course_usecase_impl.dart';
import '../../../domain/usercases/group/group_services.dart';
import '../../../domain/usercases/module_service.dart';
import '../../../external/datasources/get_course_datasource_impl.dart';
import '../../../infra/datasources/course_datasource.dart';
import '../../../infra/repositories/course_repository_impl.dart';
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

      final CourseDataSource courseDataSource =CourseDataSourceImpl(firestore);
      final CourseRepository courseRepository=CourseRepositoryImpl(courseDataSource);
      final GetAllCourseUseCase getAllCourseUseCase=GetAllCourseUseCaseImpl(courseRepository);
      return GroupController(groupService: groupService, moduleService: moduleService, getAllCourseUseCase: getAllCourseUseCase,);
    });
  }

}