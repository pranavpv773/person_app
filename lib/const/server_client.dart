import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ServerClient {
  static const int _timeout = 90;

  /* Get Method */

  static Future<List> get(String url, {BuildContext? context}) async {
    Map<String, String> headers = {"Content-Type": "application/json", "Accept": "application/json"};

    try {
      var response = await http.get(Uri.parse(url), headers: headers).timeout(const Duration(seconds: _timeout));
      // ignore: use_build_context_synchronously
      return _response(response, context);
    } on SocketException {
      return [600, "No internet"];
    } catch (e) {
      return [600, e.toString()];
    }
  }

  // ------------------- ERROR HANDLING ------------------- \\

  static Future<List> _response(http.Response response, BuildContext? context) async {
    switch (response.statusCode) {
      case 200:
        return [response.statusCode, jsonDecode(response.body)];
      case 201:
        return [response.statusCode, jsonDecode(response.body)];
      case 400:
        return [response.statusCode, jsonDecode(response.body), jsonDecode(response.body)["message"]];
      case 401:
        return [response.statusCode, jsonDecode(response.body)["message"]];
      case 403:
        return [response.statusCode, jsonDecode(response.body)["message"]];
      case 404:
        return [response.statusCode, "You're using unregistered application"];
      case 500:
        return [response.statusCode, jsonDecode(response.body)["message"]];
      case 502:
        return [response.statusCode, "Server Crashed or under maintenance"];
      case 503:
        return [response.statusCode, jsonDecode(response.body)["message"]];
      case 504:
        return [
          response.statusCode,
          {"message": "Request timeout", "code": 504, "status": "Cancelled"},
        ];
      default:
        return [response.statusCode, jsonDecode(response.body)["message"]];
    }
  }
}
