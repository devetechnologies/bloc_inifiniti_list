import 'package:bloc_infiniti_list/helpers/constants.dart';
import 'package:dio/dio.dart';

class HttpServices {
  Dio? _dio;

  final _baseUrl = BASE_URL;

  HttpServices() {
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    initializeInterceptors();
  }

  Future<Response> getResquest(String edPoint) async {
    Response? response;
    try {
      response = await _dio?.get(edPoint);
    } catch (e) {
      print(e);
    }

    return response!;
  }

  initializeInterceptors() async {
    _dio?.interceptors.add(InterceptorsWrapper(onError: (e, handler) {
      //print(e.message);
      handler.next(e);
    }, onRequest: (request, handler) {
      handler.next(request);
      print("${request.method} ${request.path}");
    }, onResponse: (response, handler) {
      handler.next(response);
      // print(response.data);
    }));
  }
}
