// 🎯 Dart imports:
import 'dart:async';
import 'dart:io';

// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:unidate/app/modules/dashboard/controllers/dashboard.controller.dart';
import 'package:unidate/app/core/utils/get.storage.dart';
import 'special_urls.http.dart';

class AppHttpInterceptor extends QueuedInterceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!AppHttpSpecialUrls.withoutToken.contains(options.uri.path)) {
      String? token = await AppGetStorage.instance.read(AppGetKey.accessToken);
      if (token != null) {
        options.headers.addAll(
          {HttpHeaders.authorizationHeader: 'Bearer $token'},
        );
      }
    }

    return handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      debugPrint('401');
    }

    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    String method = response.requestOptions.method.toUpperCase();

    debugPrint(
      'Response $method ${response.statusCode} ${response.requestOptions.uri}',
    );

    return handler.next(response);
  }
}
