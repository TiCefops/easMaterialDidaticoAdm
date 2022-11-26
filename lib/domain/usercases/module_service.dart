

abstract class ModuleService{
  Future<void> updateModulepById({required String turmaId,required Map<String,dynamic> module});
  Future<List<Map<String, dynamic>>>  getAllModules({required String courseId});

}