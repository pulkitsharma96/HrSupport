

import '../request/login_req.dart';
import '../response/login_res.dart';

abstract class LoginApi {
   Future<LoginRes> login(LoginReq req);
}
