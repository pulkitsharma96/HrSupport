import '../server/response/roles_res.dart';
import 'base_controller.dart';

class ApplicationController extends BaseController {
  var accessToken = "";
  bool isDirector = false;

  checkRole(List<Roles> list) {
    for (var item in list) {
      if (item.id == 1) {
        isDirector = true;
      }
    }
  }

  clearData(){
    accessToken="";
    isDirector=false;
  }

}
