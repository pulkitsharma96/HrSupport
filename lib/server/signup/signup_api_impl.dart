import 'package:get/get.dart';
import 'package:rms/server/signup/signup_api.dart';
import '../base/server_impl.dart';
import '../request/signup/signup_req.dart';
import '../response/common_response.dart';


class SignupApiImpl extends SignupApi {
  final server = Get.find<ServerImpl>();


  @override
  Future<CommonRes> signup(SignUpReq req) async {
    var response = await server.dio.post("/auth/signup", data: req);
    return CommonRes.fromJson(response.data["data"]);
  }
}
