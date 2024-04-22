import 'package:dio/dio.dart';

class RequestApi {
  final String contentType;
  
  final Dio _dio;


  RequestApi({required this.contentType}) : _dio = Dio(
    BaseOptions(
      baseUrl: "http://10.0.2.2:8080/api/v1/",
      responseType: ResponseType.json,
      contentType: contentType
    )
  );

  get dio => _dio;

}
