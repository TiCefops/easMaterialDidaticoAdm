
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class GetGroupService{

  Future<DocumentSnapshot> getGroup(String id);
}