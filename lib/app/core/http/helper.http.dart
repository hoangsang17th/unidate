// 🎯 Dart imports:
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'interceptor.http.dart';

class AppConnectResponse<T> {
  AppConnectResponse({
    this.data,
    required this.headers,
    this.request,
    this.statusCode,
    this.statusMessage,
    this.extra,
  });

  T? data;
  final Headers headers;
  RequestOptions? request;
  int? statusCode;
  String? statusMessage;
  Map<String, dynamic>? extra;

  static AppConnectResponse convert(Response response) {
    return AppConnectResponse(
      data: response.data,
      headers: response.headers,
      request: response.requestOptions,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }
}

/// Helper for Dio
class AppHttpHelper {
  AppHttpHelper._();
  static AppHttpHelper get instance => AppHttpHelper._();
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.1.6:3000/api/',
      contentType: Headers.jsonContentType,
    ),
  );

  Future<void> init() async {
    try {
      _dio.interceptors.add(AppHttpInterceptor());
    } catch (e) {
      debugPrint('Can\'t init the Dio');
    }
  }

  /// Convert Attachments to FormData
  FormData _mapToFormData(Map<String, dynamic> map) {
    final formData = FormData.fromMap(map);
    final FormData newData = FormData();

    for (final element in formData.fields) {
      newData.fields.add(MapEntry(element.key, element.value));
    }

    for (final element in formData.files) {
      if (element.key.contains('[') || element.key.contains(']')) {
        final newKey =
            element.key.replaceAllMapped(RegExp('([+[a-zA-Z]+])'), (m) {
          return '${m[0]}'.replaceAll('[', '.').replaceAll(']', '');
        });
        final newValue = element.value;
        final newEntry = MapEntry(newKey, newValue);
        newData.files.add(newEntry);
      } else {
        newData.files.add(element);
      }
    }

    return newData;
  }

  /// Send a request with `GET` http method.
  Future<AppConnectResponse> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Function(int value, int progress)? onReceiveProgress,
  }) async {
    final Response response = await _dio.get(
      url,
      queryParameters: queryParameters,
      onReceiveProgress: onReceiveProgress,
    );

    return AppConnectResponse.convert(response);
  }

  /// Send a request with `POST` http method.
  Future<AppConnectResponse> post(
    String url, {
    data,
    Map<String, dynamic>? formData,
    Map<String, dynamic>? queryParameters,
    Function(int count, int total)? onSendProgress,
    Function(int value, int progress)? onReceiveProgress,
    CancelToken? cancelToken,
  }) async {
    /// If formData is not null, convert to FormData.
    /// Else, use data
    if (formData != null) {
      data = _mapToFormData(formData);
    }
    final Response response = await _dio.post(
      url,
      data: data,
      onSendProgress: onSendProgress,
      queryParameters: queryParameters,
      onReceiveProgress: onReceiveProgress,
      cancelToken: cancelToken,
    );

    return AppConnectResponse.convert(response);
  }

  /// Send a request with `PUT` http method.
  Future<AppConnectResponse> put(
    String url, {
    data,
    Map<String, dynamic>? formData,
    Map<String, dynamic>? queryParameters,
    Function(int count, int total)? onSendProgress,
    Function(int value, int progress)? onReceiveProgress,
    CancelToken? cancelToken,
  }) async {
    /// If formData is not null, convert to FormData.
    /// Else, use data
    if (formData != null) {
      data = _mapToFormData(formData);
    }
    final Response response = await _dio.put(
      url,
      data: data,
      onSendProgress: onSendProgress,
      queryParameters: queryParameters,
      onReceiveProgress: onReceiveProgress,
      cancelToken: cancelToken,
    );

    return AppConnectResponse.convert(response);
  }

  /// Send a request with `DELETE` http method.
  Future<AppConnectResponse> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final Response response = await _dio.delete(
      url,
      data: data,
      queryParameters: queryParameters,
    );

    return AppConnectResponse.convert(response);
  }
}
