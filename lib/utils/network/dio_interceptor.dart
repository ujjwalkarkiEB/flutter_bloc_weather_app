import 'package:dio/dio.dart';

class DioInterceptor {
  static Dio getDio(String baseUrl, {String? apiKey}) {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    Dio dio = Dio(options);

    // dio.interceptors.add(
    //   InterceptorsWrapper(
    //     onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
    //       // Set API key for each request
    //       options.queryParameters['key'] = apiKey;
    //       print('--------Request---------');
    //       print(options.uri);
    //       return handler.next(options);
    //     },
    //     onResponse: (Response response, ResponseInterceptorHandler handler) {
    //       // Log response details
    //       print('--------Response---------');

    //       print('<--resp:  ${response.statusCode}: ${response.statusMessage}');
    //       print('----------------');

    //       return handler.next(response); // continue processing response
    //     },
    //     onError: (DioException error, ErrorInterceptorHandler handler) {
    //       print('--------On Error---------');

    //       if (error.type == DioExceptionType.connectionTimeout) {
    //         print('Connection timeout');
    //       } else if (error.type == DioExceptionType.receiveTimeout) {
    //         print('Receive timeout');
    //       } else if (error.type == DioExceptionType.badResponse) {
    //         print('Response error');
    //       } else if (error.type == DioExceptionType.cancel) {
    //         print('Request cancelled');
    //       } else if (error.type == DioExceptionType) {
    //         print('General error');
    //       }
    //       return handler.next(error);
    //     },
    //   ),
    // );

    dio.interceptors.add(LogInterceptor());

    return dio;
  }
}
