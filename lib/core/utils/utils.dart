import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Utils {
  static Dio get dioInstance {
    final dioInstance = Dio();
    dioInstance.options.followRedirects = false;
    dioInstance.options.validateStatus = (status) => status! <= 500;
    dioInstance.options.responseType = ResponseType.json;

    return dioInstance;
  }

  static ScaffoldFeatureController showInSnackBar(
      final BuildContext context, final String text) {
    final snackBar = SnackBar(
      content: Text(text),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
