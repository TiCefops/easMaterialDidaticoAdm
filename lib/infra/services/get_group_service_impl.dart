
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easmaterialdidaticoadm/domain/usercases/get_group_service.dart';
import 'package:easmaterialdidaticoadm/external/datasources/get_course_by_id_provider.dart';
import 'package:easmaterialdidaticoadm/infra/datasources/course_datasource.dart';
import '../../domain/repositories/course_repository.dart';
import '../repositories/course_repository_impl.dart';

class GetGroupServiceImpl implements GetGroupService {

  @override
  Future<DocumentSnapshot> getGroup(String id)async{
    final FirebaseFirestore firestore=FirebaseFirestore.instance;
    final courseDataSource=CourseDataSourceImpl(firestore);
    CourseRepository _repository=CourseRepositoryImpl(courseDataSource);

    return _repository.getCourseById(id: id);
  }

}