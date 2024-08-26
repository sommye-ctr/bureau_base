import 'package:bureau_base/models/employee.dart';
import 'package:dio/dio.dart';

class NetworkRepository {
  static const String baseUrl = "bureaubase.pythonanywhere.com";

  final Dio dio = Dio();

  NetworkRepository() {
    configureDio();
  }

  void configureDio() {
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 3);
  }
}
