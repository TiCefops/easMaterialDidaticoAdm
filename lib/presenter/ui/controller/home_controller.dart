


import 'package:easmaterialdidaticoadm/presenter/ui/routes/routes.dart';
import 'package:get/get.dart';

import '../../../infra/services/navigate_to_login_service.dart';

class HomeController extends GetxController{

@override
  void onInit() async{
  await NavigateToLoginService().navigateToLogin(Routes.home);

    super.onInit();


  }

 void veryfyUser(){


  }


}