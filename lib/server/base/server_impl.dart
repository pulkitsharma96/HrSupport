import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../controller/application_controller.dart';
import 'server.dart';

class ServerImpl extends Server {
  final dio = Dio();
  final controller = Get.find<ApplicationController>();
     var url="http://3.108.69.217:8080/serverside-0.0.1-SNAPSHOT/api/v1";

  ServerImpl() {
    init();
  }

  @override
  init() {
    dio.options = BaseOptions(
        baseUrl: url,
        connectTimeout: 60.seconds.inMilliseconds,
        headers: {"Authorization": "Bearer ${controller.accessToken}"});
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }
}
