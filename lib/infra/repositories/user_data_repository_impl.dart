import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easmaterialdidaticoadm/domain/repositories/users_repository.dart';
import 'package:easmaterialdidaticoadm/domain/entities/user_data_model.dart';
import 'package:easmaterialdidaticoadm/external/datasources/user_data_provider.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required this.firestore});

  final FirebaseFirestore firestore;
  late final UserDataProvider _provider = UserDataProvider(firestore: firestore);

  @override
  Future<void> disableUser({required String id}) async {
    _provider.disableUser(id: id);
  }

  @override
  Stream<QuerySnapshot> getAllUser()async* {
    yield* _provider.getAllUser();
  }

  @override
  Future<UserDataModel> getUserById({required String id}) {
    return _provider.getUserById(id: id);
  }

  @override
  Future<UserDataModel> updateUser(
      {required UserDataModel data, required String id}) {
    return _provider.updateUser(data: data, id: id);
  }
}
