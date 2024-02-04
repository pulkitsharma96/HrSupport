import '../request/signup/signup_req.dart';
import '../response/common_response.dart';

abstract class SignupApi {
  Future<CommonRes> signup(SignUpReq req);
}
