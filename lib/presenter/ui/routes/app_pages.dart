
import 'package:easmaterialdidaticoadm/presenter/ui/binding/group_bindng.dart';
import 'package:easmaterialdidaticoadm/presenter/ui/pages/group_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

import '../binding/home_binding.dart';
import '../binding/user_manager_bindings.dart';
import './routes.dart';
import '../pages/home_page.dart';
import '../pages/user_manager_page.dart';



User? user = FirebaseAuth.instance.currentUser;

class AppPages {
  static final routes = [
    GetPage(
        name: Routes.initial,
        page: () => HomePage(),
        transition: Transition.noTransition,
        binding: HomeBindings()),
    GetPage(
        name: Routes.userManager,
        page: () => UserManagerPage(),
        transition: Transition.noTransition,
        binding: UserManagerBindings()),
    GetPage(
        name: Routes.groupManager,
        page: () => GroupPage(),
        transition: Transition.noTransition,
        binding: GroupBindings()),
  ];
}
