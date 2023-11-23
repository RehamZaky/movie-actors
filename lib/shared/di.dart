import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_assessment_task/images/data/repos/images_repo.dart';
import 'package:flutter_assessment_task/main.dart';
import 'package:flutter_assessment_task/popular/data/repos/popular_repo.dart';
import 'package:flutter_assessment_task/popular_details/data/repos/details_repo.dart';
import 'package:flutter_assessment_task/shared/helpers/dio_error_dialog.dart';
import 'package:flutter_assessment_task/shared/style/constants.dart';
import 'package:get_it/get_it.dart';

GetIt di = GetIt.I;

enum ErrorType { noInternet, serverError }

class _AppInterceptor extends Interceptor {
  @override
  Future<void> onError(
      DioException error, ErrorInterceptorHandler handler) async {
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        (error.type == DioExceptionType.unknown &&
            (error.error is SocketException || error.error is HttpException))) {
      DioErrorDialog.show(
        context: navigatorKey.currentContext!,
        errorType: ErrorType.noInternet,
        title: 'Internet error', //TODO:
        message: 'Internet error, please try again',
      );
    }

    if (error.type == DioExceptionType.badResponse &&
        error.response != null &&
        error.response!.statusCode! >= 500) {
      DioErrorDialog.show(
        context: navigatorKey.currentContext!,
        errorType: ErrorType.serverError,
        title: 'Error',
        message: 'Bad Response',
      );

      return handler.reject(
        DioException(
          type: DioExceptionType.badResponse,
          requestOptions: error.requestOptions,
          response: Response(
            requestOptions: error.requestOptions,
            data: {'message': 'Error'},
          ),
        ),
      );
    }

    handler.reject(error);
  }
}


Future<void> init() async {
  final dio = Dio(
    BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 3),
        receiveTimeout: const Duration(seconds: 3),
        headers: apiHeaders),
  )..interceptors.addAll([
      _AppInterceptor(),
    ]);

  di.registerLazySingleton<Dio>(() => dio);

  di.registerLazySingleton(() => PopularRepo());
  di.registerLazySingleton(() => PopularDetailsRepo());
  di.registerLazySingleton(() => ImagesRepo());
}
