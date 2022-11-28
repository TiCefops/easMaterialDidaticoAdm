
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/course_entity.dart';
import '../../domain/repositories/course_repository.dart';
import '../../domain/usercases/group/get_group_service.dart';
import '../../external/datasources/get_course_datasource_impl.dart';
import '../repositories/course_repository_impl.dart';

class GetGroupServiceImpl implements GetGroupService {

  @override
  Future<CourseEntity> getGroup(String id)async{
    final FirebaseFirestore firestore=FirebaseFirestore.instance;
    final courseDataSource=CourseDataSourceImpl(firestore);
    CourseRepository _repository=CourseRepositoryImpl(courseDataSource);

    return _repository.getCourseById(id: id);
  }

}