import 'package:get/get.dart';
import 'package:dio/dio.dart';

class DioController extends GetxController {
  late Dio dio;
  @override
  void onInit() {
    // TODO: implement onInit
    dio = Dio(BaseOptions(
        baseUrl: 'https://run.mocky.io/',
        receiveTimeout: const Duration(seconds: 8),
    ));
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    dio.close(force: true);
    super.dispose();
  }

}