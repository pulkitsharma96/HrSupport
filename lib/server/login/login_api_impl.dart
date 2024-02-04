import 'package:get/get.dart';
import '../base/server_impl.dart';
import '../request/login_req.dart';
import '../response/login_res.dart';
import 'login_api.dart';


class LoginApiImpl extends LoginApi {
  final server = Get.find<ServerImpl>();

  @override
  Future<LoginRes> login(LoginReq req) async {
    var response = await server.dio.post("/auth/login", data: req);
    return LoginRes.fromJson(response.data["data"]);
  }
}
